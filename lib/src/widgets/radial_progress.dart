import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  const RadialProgress({
    Key? key,
    required this.percent,
    this.duration,
    this.progressColor,
    this.backgroundColor,
    this.progressThickness = 10,
    this.backgroundThickness = 10,
    this.progressRounded = false,
    this.progressGradientColor,
  }) : super(key: key);
  final double percent;
  final Duration? duration;
  final Color? progressColor;
  final Gradient? progressGradientColor;
  final Color? backgroundColor;
  final double progressThickness;
  final double backgroundThickness;
  final bool progressRounded;

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  double lastPercent = 0;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: widget.duration ?? const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller!.forward(from: 0.0);

    final diferenceAnim = widget.percent - lastPercent;
    lastPercent = widget.percent;

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          width: double.maxFinite,
          height: double.maxFinite,
          child: CustomPaint(
            painter: _RadialProgress(
              colorGradient: widget.progressGradientColor,
              rounded: widget.progressRounded,
              primaryColor:
                  widget.progressColor ?? Theme.of(context).colorScheme.primary,
              backgroundColor:
                  widget.backgroundColor ?? Theme.of(context).disabledColor,
              primaryThickness: widget.progressThickness,
              backgroundThickness: widget.backgroundThickness,
              percent: widget.percent -
                  diferenceAnim +
                  (diferenceAnim * controller!.value),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _RadialProgress extends CustomPainter {
  _RadialProgress(
      {required this.percent,
      required this.primaryColor,
      required this.backgroundColor,
      required this.primaryThickness,
      required this.backgroundThickness,
      this.rounded = false,
      this.colorGradient});
  final double percent;
  final Color primaryColor;
  final Color backgroundColor;
  final double primaryThickness;
  final double backgroundThickness;
  final bool rounded;
  final Gradient? colorGradient;
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = backgroundThickness
      ..color = backgroundColor
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);
    if (percent > 0) {
      // arco
      final paintArc = Paint()
        ..strokeWidth = primaryThickness
        ..color = primaryColor
        ..style = PaintingStyle.stroke;
      if (rounded) paintArc.strokeCap = StrokeCap.round;

      if (colorGradient != null) {
        final rect = Rect.fromCircle(center: const Offset(80, 0), radius: 180);
        paintArc.shader = colorGradient!.createShader(rect);
      }

      // Parte que se deberá ir llenando
      double arcAngle = 2 * pi * (percent / 100);

      canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
          arcAngle, false, paintArc);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

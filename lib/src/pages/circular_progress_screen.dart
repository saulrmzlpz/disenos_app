import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressScreen extends StatefulWidget {
  const CircularProgressScreen({Key? key}) : super(key: key);

  @override
  State<CircularProgressScreen> createState() => _CircularProgressScreenState();
}

class _CircularProgressScreenState extends State<CircularProgressScreen>
    with SingleTickerProviderStateMixin {
  double percent = 0;
  double newPercent = 0;
  AnimationController? controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller!.addListener(() {
      percent = lerpDouble(percent, newPercent, controller!.value) ?? 0;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5.0),
          width: 100,
          height: 100,
          child: CustomPaint(
            painter: _MyRadialProgress(percent: percent),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          percent = newPercent;
          newPercent += 10;
          if (newPercent > 100) {
            newPercent = 0;
            percent = 0;
          }

          controller!.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _MyRadialProgress extends CustomPainter {
  _MyRadialProgress({required this.percent});
  final double percent;
  @override
  void paint(Canvas canvas, Size size) {
    // Circulo completado
    final paint = Paint()
      ..strokeWidth = 10
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * 0.5, size.height * 0.5);
    final double radius = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radius, paint);

    // arco
    final paintArc = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Parte que se deberá ir llenando
    double arcAngle = 2 * pi * (percent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paintArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

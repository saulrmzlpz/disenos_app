import 'package:flutter/material.dart';

import 'dart:math' as math;

class AnimsScreen extends StatelessWidget {
  const AnimsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado(),
      ),
    );
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? rotation;
  Animation<double>? opacity;
  Animation<double>? opacityOut;
  Animation<double>? moveToRight;
  Animation<double>? scale;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 4000));

    rotation = Tween(begin: 0.0, end: 2 * math.pi)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    //El intervalo está basado en el porcentaje del tiempo definido en el controller
    opacity = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: controller!, curve: Interval(0, 0.25, curve: Curves.easeOut)));

    opacityOut = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut)));

    moveToRight = Tween(begin: 0.0, end: 200.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    scale = Tween(begin: 0.0, end: 2.0)
        .animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    controller!.addListener(() {
      print(controller!.status);
      if (controller!.status == AnimationStatus.completed) {
        // controller!.reverse();
        controller!.reset();
        // controller!.repeat();
      }
      //  else if (controller!.status == AnimationStatus.dismissed) {
      //   controller!.forward();
      // }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Play
    controller!.forward();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moveToRight!.value, 0),
          child: Transform.rotate(
            angle: rotation!.value,
            child: Opacity(
                opacity:
                    //PROPIA SOLUCION AL RETO
                    opacity!.value == 1.0 ? opacityOut!.value : opacity!.value,
                child: Transform.scale(scale: scale!.value, child: child)),
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

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

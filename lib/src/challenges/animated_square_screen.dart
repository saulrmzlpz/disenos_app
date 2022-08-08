import 'package:flutter/material.dart';

class AnimatedSquareScreen extends StatelessWidget {
  const AnimatedSquareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _AnimatedSquare(),
      ),
    );
  }
}

class _AnimatedSquare extends StatefulWidget {
  const _AnimatedSquare({
    Key? key,
  }) : super(key: key);

  @override
  State<_AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<_AnimatedSquare>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  // Animations
  Animation<double>? moveSquareRight;
  Animation<double>? moveSquareLeft;
  Animation<double>? moveSquareUp;
  Animation<double>? moveSquareDown;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    moveSquareRight = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));

    moveSquareUp = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.25, 0.50, curve: Curves.bounceOut)));
    moveSquareLeft = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.50, 0.75, curve: Curves.bounceOut)));
    moveSquareDown = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: controller!,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut)));

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
    controller!.forward();
    return AnimatedBuilder(
      animation: controller!,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moveSquareRight!.value - moveSquareLeft!.value,
              moveSquareDown!.value - moveSquareUp!.value),
          child: child,
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

import 'package:disenos_app/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class SlideshowScreen extends StatelessWidget {
  const SlideshowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: const [
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 70,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
        _Dot(index: 0),
        _Dot(index: 1),
        _Dot(index: 2),
      ]),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (pageViewIndex >= index - 0.5 && pageViewIndex < index + 0.5)
              ? Colors.pink
              : Colors.grey),
    );
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key}) : super(key: key);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: const [
        _Slide(svg: 'assets/svgs/slide-1.svg'),
        _Slide(svg: 'assets/svgs/slide-2.svg'),
        _Slide(svg: 'assets/svgs/slide-3.svg'),
      ],
    );
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
}

class _Slide extends StatelessWidget {
  const _Slide({
    Key? key,
    required this.svg,
  }) : super(key: key);

  final String svg;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(30),
        child: SvgPicture.asset(svg));
  }
}

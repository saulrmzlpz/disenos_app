import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  const Slideshow(
      {Key? key,
      required this.slides,
      this.invertDots = false,
      this.primaryColor = Colors.pink,
      this.secondaryColor = Colors.grey,
      this.primaryBulletSize = 12,
      this.seconaryBulletSize = 12})
      : super(key: key);

  final List<Widget> slides;
  final bool invertDots;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBulletSize;
  final double seconaryBulletSize;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(builder: (BuildContext context) {
            final ssModel =
                Provider.of<_SlideshowModel>(context, listen: false);

            ssModel.primaryColor = primaryColor;
            ssModel.secondaryColor = secondaryColor;
            ssModel.currentDotSize = primaryBulletSize;
            ssModel.backgroundDotSize = seconaryBulletSize;
            return _SlideshowBody(invertDots: invertDots, slides: slides);
          }),
        ),
      ),
    );
  }
}

class _SlideshowBody extends StatelessWidget {
  const _SlideshowBody({
    Key? key,
    required this.invertDots,
    required this.slides,
  }) : super(key: key);

  final bool invertDots;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (invertDots) _Dots(length: slides.length),
        Expanded(child: _Slides(slides: slides)),
        if (!invertDots) _Dots(length: slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({Key? key, required this.length}) : super(key: key);

  final int length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(length, (index) => _Dot(index: index))),
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
    final ssModel = Provider.of<_SlideshowModel>(context);
    double size = 0;
    Color color;
    if (ssModel.currentPage >= index - 0.5 &&
        ssModel.currentPage < index + 0.5) {
      size = ssModel.currentDotSize;
      color = ssModel.primaryColor;
    } else {
      size = ssModel.backgroundDotSize;
      color = ssModel.secondaryColor;
    }
    return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: size,
        height: size,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ));
  }
}

class _Slides extends StatefulWidget {
  const _Slides({Key? key, required this.slides}) : super(key: key);

  final List<Widget> slides;

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      Provider.of<_SlideshowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageViewController,
      children: widget.slides.map((slide) => _Slide(slide: slide)).toList(),
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
    required this.slide,
  }) : super(key: key);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.all(30),
        child: slide);
  }
}

class _SlideshowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.pink;
  Color _secondaryColor = Colors.grey;

  double _currentDotSize = 12;
  double _backgroundDotSize = 12;

  double get currentDotSize => _currentDotSize;

  set currentDotSize(double size) => _currentDotSize = size;

  double get backgroundDotSize => _backgroundDotSize;

  set backgroundDotSize(double size) => _backgroundDotSize = size;

  Color get primaryColor => _primaryColor;

  set primaryColor(Color color) => _primaryColor = color;

  Color get secondaryColor => _secondaryColor;

  set secondaryColor(Color color) => _secondaryColor = color;

  double get currentPage => _currentPage;

  set currentPage(double currentPage) {
    _currentPage = currentPage;
    notifyListeners();
  }
}

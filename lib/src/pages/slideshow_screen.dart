import 'package:disenos_app/src/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowScreen extends StatelessWidget {
  const SlideshowScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: _MySlideshow()),
          Expanded(child: _MySlideshow()),
        ],
      ),
    );
  }
}

class _MySlideshow extends StatelessWidget {
  const _MySlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      primaryBulletSize: 20,
      seconaryBulletSize: 12,
      primaryColor: Colors.red,
      secondaryColor: Colors.black,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}

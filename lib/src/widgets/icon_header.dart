import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  const IconHeader({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.colorBegin = const Color(0xFF526BF6),
    this.colorEnd = const Color(0xFF67ACF2),
  }) : super(key: key);
  final Color colorWhite = Colors.white70;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color colorBegin;
  final Color colorEnd;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _BackgroundHeader(colorBegin: colorBegin, colorEnd: colorEnd),
        Positioned(
            top: -50,
            left: -70,
            child: FaIcon(icon, size: 250, color: Colors.white24)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            Text(
              subtitle,
              style: TextStyle(fontSize: 20, color: colorWhite),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                  fontSize: 25, color: colorWhite, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Center(child: FaIcon(icon, size: 80, color: Colors.white)),
          ],
        ),
        Positioned(
          right: 0,
          top: 45,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                FontAwesomeIcons.ellipsisVertical,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

class _BackgroundHeader extends StatelessWidget {
  const _BackgroundHeader({
    Key? key,
    required this.colorBegin,
    required this.colorEnd,
  }) : super(key: key);
  final Color colorBegin;
  final Color colorEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF526BF6),
            Color(0xFF67ACF2),
          ],
        ),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
      ),
    );
  }
}

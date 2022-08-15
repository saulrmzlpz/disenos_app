import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class BigButton extends StatelessWidget {
  const BigButton(
      {Key? key,
      required this.icon,
      required this.text,
      this.colorBegin = Colors.grey,
      this.colorEnd = Colors.blueGrey,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final String text;
  final Color colorBegin;
  final Color colorEnd;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: GestureDetector(
        onTap: onPressed,
        child: Stack(
          children: [
            _BigButtonBackground(
                icon: icon, colorBegin: colorBegin, colorEnd: colorEnd),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 140, width: 40),
                FaIcon(icon, color: Colors.white, size: 40),
                SizedBox(width: 20),
                Expanded(
                  child: Text(text,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
                FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
                SizedBox(width: 40),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BigButtonBackground extends StatelessWidget {
  const _BigButtonBackground({
    Key? key,
    required this.icon,
    required this.colorBegin,
    required this.colorEnd,
  }) : super(key: key);
  final IconData icon;
  final Color colorBegin;
  final Color colorEnd;
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(20),
      width: double.maxFinite,
      height: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [colorBegin, colorEnd],
          ),
          boxShadow: const [
            BoxShadow(
                color: Colors.black38, offset: Offset(4, 6), blurRadius: 10)
          ],
          borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Positioned(
            right: -20,
            top: -20,
            child: FaIcon(
              icon,
              size: 150,
              color: Colors.white.withOpacity(0.2),
            ))
      ]),
    );
  }
}

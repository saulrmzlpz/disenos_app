import 'package:disenos_app/src/widgets/big_button.dart';
import 'package:disenos_app/src/widgets/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyScreen extends StatelessWidget {
  const EmergencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.32),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Motor Accident',
                colorBegin: Color(0xFF6989F5),
                colorEnd: Color(0xFF906EF5),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Medical Emergency',
                colorBegin: Color(0xff66A9F2),
                colorEnd: Color(0xff536CF6),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Theft / Harrasement',
                colorBegin: Color(0xffF2D572),
                colorEnd: Color(0xffE06AA3),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Awards',
                colorBegin: Color(0xff317183),
                colorEnd: Color(0xff46997D),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Motor Accident',
                colorBegin: Color(0xFF6989F5),
                colorEnd: Color(0xFF906EF5),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Medical Emergency',
                colorBegin: Color(0xff66A9F2),
                colorEnd: Color(0xff536CF6),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Theft / Harrasement',
                colorBegin: Color(0xffF2D572),
                colorEnd: Color(0xffE06AA3),
                onPressed: () {},
              ),
              BigButton(
                icon: FontAwesomeIcons.carBurst,
                text: 'Awards',
                colorBegin: Color(0xff317183),
                colorEnd: Color(0xff46997D),
                onPressed: () {},
              ),
            ],
          ),
          IconHeader(
            icon: FontAwesomeIcons.plus,
            subtitle: 'Has solicitado',
            title: 'Asistencia médica',
          ),
        ],
      ),
      // body: BigButton(
      //   icon: FontAwesomeIcons.carBurst,
      //   text: 'Car Accident',
      //   colorBegin: Color(0xFF6989F5),
      //   colorEnd: Color(0xFF906EF5),
      //   onPressed: () {},
      // ),
    );
  }
}

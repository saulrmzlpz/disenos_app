import 'package:disenos_app/src/screens/anims_screen.dart';
import 'package:disenos_app/src/screens/circular_graphics_screen.dart';
import 'package:disenos_app/src/screens/emergency_screen.dart';
import 'package:disenos_app/src/screens/headers_screen.dart';
import 'package:disenos_app/src/screens/pinteres_screen.dart';
import 'package:disenos_app/src/screens/slideshow_screen.dart';
import 'package:disenos_app/src/screens/sliver_list_screen.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppRoutes {
  static final screenRoutes = [
    _Route(icon: FontAwesomeIcons.slideshare, title: 'Sildeshow', screen: const SlideshowScreen()),
    _Route(icon: FontAwesomeIcons.truckMedical, title: 'Emergencia', screen: const EmergencyScreen()),
    _Route(icon: FontAwesomeIcons.heading, title: 'Encabezados', screen: const HeadersScreen()),
    _Route(icon: FontAwesomeIcons.peopleCarryBox, title: 'Cuadro Animado', screen: const AnimsScreen()),
    _Route(icon: FontAwesomeIcons.circleNodes, title: 'Barra progreso', screen: const CircularGraphicsScreen()),
    _Route(icon: FontAwesomeIcons.pinterest, title: 'Pinteres', screen: const PinterestScreen()),
    _Route(icon: FontAwesomeIcons.mobile, title: 'Slivers', screen: const SliverListScreen()),
  ];
}

class _Route {
  final IconData icon;
  final String title;
  final Widget screen;
  _Route({required this.icon, required this.title, required this.screen});
}

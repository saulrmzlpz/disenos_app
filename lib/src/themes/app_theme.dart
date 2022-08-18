import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  AppTheme(int theme) {
    switch (theme) {
      case 1:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = _lightThemeData;
        break;
      case 2:
        _darkTheme = true;
        _customTheme = false;
        _currentTheme = _darkThemeData;
        break;
      case 3:
        _darkTheme = false;
        _customTheme = true;
        break;
      default:
        _darkTheme = false;
        _customTheme = false;
        _currentTheme = _lightThemeData;
    }
  }

  bool _darkTheme = false;
  bool _customTheme = false;
  final ThemeData _darkThemeData = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(),
  );
  final ThemeData _lightThemeData = ThemeData.light().copyWith();
  ThemeData? _currentTheme;

  bool get darkTheme => _darkTheme;

  bool get customTheme => _customTheme;

  ThemeData? get currentTheme => _currentTheme;

  set darkTheme(bool value) {
    _customTheme = false;
    _darkTheme = value;

    if (value) {
      _currentTheme = _darkThemeData;
    } else {
      _currentTheme = _lightThemeData;
    }
    notifyListeners();
  }

  set customTheme(bool value) {
    _customTheme = value;
    _darkTheme = false;
    if (value) {
      _currentTheme = _darkThemeData.copyWith(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink),
      );
    } else {
      _currentTheme = _lightThemeData;
    }
    notifyListeners();
  }
}

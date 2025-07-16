import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xfff2680d),
    unselectedItemColor: Colors.grey,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xfff2680d),
    brightness: Brightness.light,
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff130f0c),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xfff2680d),
    brightness: Brightness.dark,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff130f0c),
    selectedItemColor: Color(0xfff2680d),
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(
      color: Color(0xfff2680d),
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.grey,
    ),
    type: BottomNavigationBarType.fixed,
  ),
);

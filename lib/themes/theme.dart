import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Color(0xfff2680d),
    unselectedItemColor: Colors.grey,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey[800],
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xfff2680d),
    brightness: Brightness.light,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color(0xff130f0c),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xff130f0c),
    selectedItemColor: Color(0xfff2680d),
    unselectedItemColor: Colors.grey,
    selectedLabelStyle: TextStyle(color: Color(0xfff2680d)),
    unselectedLabelStyle: TextStyle(color: Colors.grey),
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      color: Colors.grey[300],
      fontWeight: FontWeight.w500,
    ),
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xfff2680d),
    brightness: Brightness.dark,
  ),
);

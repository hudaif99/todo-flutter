import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Nunito',
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 20)
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
        fontSize: 14,
        letterSpacing: 2.5,
        color: Colors.black
    )
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: Color(0xFF717171),
    indicatorSize: TabBarIndicatorSize.label
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.light(
      primary: Color(0xFFF2F2F2),
      secondary: Colors.black
    ),
  ),
  colorScheme: const ColorScheme.light(
    background: Colors.white,
    primary: Color(0xFFB39DDB),
    secondary: Color(0xFFE2E2E2),
    tertiary: Color(0xFFECECEC)
  )
);
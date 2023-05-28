import 'package:flutter/material.dart';

// ThemeData darkTheme = ThemeData(
//   useMaterial3: true,
//   brightness: Brightness.dark,
//   appBarTheme: const AppBarTheme(
//     backgroundColor: Colors.black
//   ),
//   colorScheme: ColorScheme.dark(
//     background: Colors.black,
//     primary: Colors.grey[900]!,
//     secondary: Colors.grey[800]!
//   )
// );

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Nunito',
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  textTheme: const TextTheme(
    titleMedium: TextStyle(
      fontSize: 14,
      letterSpacing: 2.5,
      color: Colors.white,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorColor: Colors.white,
    indicatorSize: TabBarIndicatorSize.label,
  ),
  buttonTheme: const ButtonThemeData(
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF333333),
      secondary: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF1E1E1E),
    primary: Color(0xFFB39DDB),
    secondary: Color(0xFF333333),
    tertiary: Color(0xFF292929),
  ),
);
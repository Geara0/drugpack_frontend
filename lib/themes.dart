import 'package:flutter/material.dart';

class ThemeClass {
  Color lightPrimaryColor = Colors.black54;

  Color darkPrimaryColor = Colors.black54;

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    textButtonTheme: const TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white))),
    elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(Colors.white))),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
    ),
  );

  static BoxDecoration containerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.7),
        spreadRadius: 5,
        blurRadius: 15,
        offset: const Offset(0, 3),
      ),
    ],
  );
}

ThemeClass _themeClass = ThemeClass();

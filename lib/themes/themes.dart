import 'package:flutter/material.dart';

class ThemeClass {
  static const Color lightAppBarColor = Color(0xFFD3E3FF);
  static const Color lightStatusBarColor = Color(0xFFACCAFF);
  static const Color lightBackgroundColor = Colors.white;
  static const Color lightBoxDecorationColor = Color(0xFFD3E3FF);
  static const Color lightTextColor = Color(0xFF002566);
  static const Color lightTextButtonColor = Color(0xFF002566);
  static const Color lightTextFieldInsideColor = Color(0xFFD3E3FF);
  static const Color lightTextFieldBorderColor = Color(0xFF002566);
  static const Color lightElevatedButtonColor = Color(0xFF002566);
  static const Color lightElevatedButtonTextColor = Color(0xFFD3E3FF);
  static const Color lightElevatedButtonShadowColor = Color(0xFF7BABFF);
  static const Color lightIconColor = Color(0xFF002566);
  static const Color lightInputTextColor = Color(0xFF000A1B);

  static const Color darkAppBarColor = Color(0xFF002566);
  static const Color darkStatusBarColor = Color(0xFF001A47);
  static const Color darkBackgroundColor = Color(0xFF000A1B);
  static const Color darkBoxDecorationColor = Color(0xFF7BABFF);
  static const Color darkTextColor = Color(0xFFD3E3FF);
  static const Color darkTextButtonColor = Color(0xFFD3E3FF);
  static const Color darkTextFieldInsideColor = Color(0xFFD3E3FF);
  static const Color darkTextFieldBorderColor = Color(0xFF001A47);
  static const Color darkElevatedButtonColor = Color(0xFF7BABFF);
  static const Color darkElevatedButtonTextColor = Color(0xFF000A1B);
  static const Color darkElevatedButtonShadowColor = Color(0xFF7BABFF);
  static const Color darkIconColor = Color(0xFF7BABFF);
  static const Color darkInputTextColor = Color(0xFF000A1B);

  static const Color lightInnerColor = Color(0xFFE6EFFF);
  static const Color darkInnerColor = Color(0xFF001A47);
  static const Color borderColor = Color(0xFF002566);
  static const Color shadowColor = Color(0xFF7BABFF);

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: lightIconColor),
      backgroundColor: lightAppBarColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightAppBarColor,
    ),
    colorScheme: const ColorScheme.light().copyWith(),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(lightTextButtonColor),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(lightElevatedButtonColor),
        shadowColor: MaterialStatePropertyAll(lightElevatedButtonShadowColor),
        foregroundColor: MaterialStatePropertyAll(lightElevatedButtonTextColor),
      ),
    ),
    scaffoldBackgroundColor: lightBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightTextFieldInsideColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: lightTextFieldBorderColor),
      ),
    ),
    iconTheme: const IconThemeData(color: lightIconColor),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: lightInputTextColor),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: darkIconColor),
      backgroundColor: darkAppBarColor,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkAppBarColor,
    ),
    colorScheme: const ColorScheme.dark().copyWith(),
    textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStatePropertyAll(darkTextButtonColor),
      ),
    ),
    elevatedButtonTheme: const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(darkElevatedButtonColor),
        shadowColor: MaterialStatePropertyAll(darkElevatedButtonShadowColor),
        foregroundColor: MaterialStatePropertyAll(darkElevatedButtonTextColor),
      ),
    ),
    scaffoldBackgroundColor: darkBackgroundColor,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkTextFieldInsideColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: darkTextFieldBorderColor),
      ),
    ),
    iconTheme: const IconThemeData(color: darkIconColor),
    textTheme: const TextTheme(
      titleMedium: TextStyle(color: darkInputTextColor),
    ),
  );

  static BoxDecoration containerDecoration(BuildContext context) {
    Color innerColor = Theme.of(context).brightness == Brightness.light
        ? lightInnerColor
        : darkInnerColor;
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: innerColor,
      border: Border.all(color: borderColor),
      boxShadow: const [
        BoxShadow(
          color: shadowColor,
          blurRadius: 1,
        ),
      ],
    );
  }

  static BoxDecoration containerBackgroundDecoration(BuildContext context) {
    String innerImage = Theme.of(context).brightness == Brightness.light
        ? 'assets/images/light_auth_background.png'
        : 'assets/images/dark_auth_background.png';
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(innerImage),
        fit: BoxFit.cover,
      ),
    );
  }
}

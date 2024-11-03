import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkBackground = Color(0xFF030303);
  static const Color darkText = Color(0xFF666666);
  static const Color lightBackground = Color(0xFFF7F7F7);
  static const Color lightText = Color(0xFF292929);

  // Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: lightBackground,
    primaryColor: lightText,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: lightText, fontFamily: 'Karla'),
      bodyMedium: TextStyle(color: lightText, fontFamily: 'Karla'),
      titleLarge: TextStyle(color: lightText, fontFamily: 'Karla'),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: lightBackground,
      titleTextStyle: TextStyle(color: lightText, fontFamily: 'Karla', fontSize: 20),
      iconTheme: IconThemeData(color: lightText),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: lightText,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: lightText,
      onPrimary: lightBackground, // Text on primary buttons
      secondary: Colors.blue, 
      onSecondary: Colors.white, // Text on secondary buttons
      error: Colors.red, 
      onError: Colors.white, // Text on error backgrounds
      surface: Colors.grey[200]!, // Card background
      onSurface: lightText, // Text on card backgrounds
    ),
  );

  // Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBackground,
    primaryColor: darkText,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: darkText, fontFamily: 'Karla'),
      bodyMedium: TextStyle(color: darkText, fontFamily: 'Karla'),
      titleLarge: TextStyle(color: darkText, fontFamily: 'Karla'),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: darkBackground,
      titleTextStyle: TextStyle(color: darkText, fontFamily: 'Karla', fontSize: 20),
      iconTheme: IconThemeData(color: darkText),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: darkText,
      textTheme: ButtonTextTheme.primary,
    ),
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: darkText,
      onPrimary: darkBackground, // Text on primary buttons
      secondary: Colors.greenAccent, 
      onSecondary: Colors.black, // Text on secondary buttons
      error: Colors.redAccent, 
      onError: Colors.black, // Text on error backgrounds
      surface: Colors.grey[800]!, // Card background
      onSurface: darkText, // Text on card backgrounds
    ),
  );
}
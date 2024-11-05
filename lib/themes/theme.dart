import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkBackground = Color(0xFF030303);
  static const Color darkText = Color(0xFF666666);
  static const Color lightBackground = Color(0xFFF7F7F7);
  static const Color lightText = Color(0xFF292929);
  static const Color appBarColor = Color(0xFFE0E0E0); // Light gray
  static const Color appBarDarkColor = Color(0xFF333333); // Dark gray for app bar
  static const Color appBarTextColor = Color(0xFF000000); // Black text color
  static const Color bottomNavBarColor = Color(0xFFE0E0E0); // Light gray
  static const Color bottomNavDarkColor = Color(0xFF424242); // Slightly lighter gray
  static const Color bottomNavBarSelectedColor = Color(0xFF000000); // Black for selected icons
  static const Color bottomNavBarUnselectedColor = Color(0xFF757575); // Gray for unselected icons

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
    appBarTheme: AppBarTheme(
      backgroundColor: appBarColor, // Use light gray for AppBar
      titleTextStyle: TextStyle(color: appBarTextColor, fontFamily: 'Karla', fontSize: 20),
      iconTheme: IconThemeData(color: appBarTextColor),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: lightText,
      textTheme: ButtonTextTheme.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: appBarColor, // Light gray for Bottom Navigation Bar
      selectedItemColor: appBarTextColor, // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
      selectedLabelStyle: TextStyle(color: bottomNavBarSelectedColor), // Selected label color
      unselectedLabelStyle: TextStyle(color: bottomNavBarUnselectedColor), // Unselected label color
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
    appBarTheme: AppBarTheme(
      backgroundColor: appBarDarkColor,
      titleTextStyle: TextStyle(color: Colors.black, fontFamily: 'Karla', fontSize: 20),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: darkText,
      textTheme: ButtonTextTheme.primary,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bottomNavDarkColor, // Dark background for Bottom Navigation Bar
      selectedItemColor: Colors.black, // Black for selected icons
      unselectedItemColor: Colors.grey, // Gray for unselected icons
      selectedLabelStyle: TextStyle(color: bottomNavBarSelectedColor), // Selected label color
      unselectedLabelStyle: TextStyle(color: bottomNavBarUnselectedColor), // Unselected label color
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

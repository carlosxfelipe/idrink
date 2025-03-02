import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
        surface: Colors.white,
        onSurface: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.red,
        brightness: Brightness.dark,
        surface: const Color(0xFF121212),
        onSurface: Colors.white,
      ),
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF121212),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}

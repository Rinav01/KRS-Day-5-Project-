// theme.dart

import 'package:flutter/material.dart';

/// Custom color scheme for light mode
const ColorScheme customLightColorScheme = ColorScheme(
  primary: Color(0xFF1976D2),           // Blue
  primaryContainer: Color(0xFF63A4FF),  // Lighter blue
  secondary: Color(0xFFFFA000),         // Amber
  secondaryContainer: Color(0xFFFFD149),
  surface: Colors.white,        // Light grey
  error: Color(0xFFD32F2F),             // Red
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);

/// Custom color scheme for dark mode
const ColorScheme customDarkColorScheme = ColorScheme(
  primary: Color(0xFF90CAF9),           // Light blue
  primaryContainer: Color(0xFF1976D2),  // Blue
  secondary: Color(0xFFFFD149),         // Light amber
  secondaryContainer: Color(0xFFFFA000),
  surface: Color(0xFF222831),           // Dark surface
  background: Color(0xFF121212),        // Dark background
  error: Color(0xFFCF6679),             // Red (dark)
  onPrimary: Colors.black,
  onSecondary: Colors.black,
  onSurface: Colors.white,
  onBackground: Colors.white,
  onError: Colors.black,
  brightness: Brightness.dark,
);

/// ThemeData for light mode
final ThemeData customLightTheme = ThemeData(
  colorScheme: customLightColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: customLightColorScheme.primary,
    foregroundColor: customLightColorScheme.onPrimary,
    elevation: 2,
  ),
  scaffoldBackgroundColor: customLightColorScheme.background,
  cardColor: Colors.white,
  iconTheme: IconThemeData(color: customLightColorScheme.primary),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: customLightColorScheme.primary,
    ),
    bodyMedium: TextStyle(color: Colors.black87),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: customLightColorScheme.primary),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: customLightColorScheme.onSecondary, backgroundColor: customLightColorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: customLightColorScheme.secondaryContainer,
    selectedColor: customLightColorScheme.secondary,
    labelStyle: TextStyle(color: Colors.black),
    secondaryLabelStyle: TextStyle(color: Colors.black),
    brightness: Brightness.light,
  ),
);

/// ThemeData for dark mode
final ThemeData customDarkTheme = ThemeData(
  colorScheme: customDarkColorScheme,
  appBarTheme: AppBarTheme(
    backgroundColor: customDarkColorScheme.primary,
    foregroundColor: customDarkColorScheme.onPrimary,
    elevation: 2,
  ),
  scaffoldBackgroundColor: customDarkColorScheme.background,
  cardColor: customDarkColorScheme.surface,
  iconTheme: IconThemeData(color: customDarkColorScheme.primary),
  textTheme: TextTheme(
    titleLarge: TextStyle(
      fontWeight: FontWeight.bold,
      color: customDarkColorScheme.primary,
    ),
    bodyMedium: TextStyle(color: Colors.white70),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: customDarkColorScheme.primary),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: customDarkColorScheme.onSecondary, backgroundColor: customDarkColorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  chipTheme: ChipThemeData(
    backgroundColor: customDarkColorScheme.secondaryContainer,
    selectedColor: customDarkColorScheme.secondary,
    labelStyle: TextStyle(color: Colors.black),
    secondaryLabelStyle: TextStyle(color: Colors.black),
    brightness: Brightness.dark,
  ),
);

/// Export these for use in main.dart:
///   - customLightTheme
///   - customDarkTheme

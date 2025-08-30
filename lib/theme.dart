import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Custom color scheme for light mode
const ColorScheme customLightColorScheme = ColorScheme(
  primary: Color(0xFF008080),           // Vibrant Teal
  primaryContainer: Color(0xFF48D1CC),  // Lighter Teal
  secondary: Color(0xFFFF7F50),         // Coral
  secondaryContainer: Color(0xFFFFA07A), // Lighter Coral
  surface: Colors.white,
  background: Color(0xFFF5F5F5),        // Off-white
  error: Color(0xFFD32F2F),             // Red
  onPrimary: Colors.white,
  onSecondary: Colors.black,
  onSurface: Colors.black,
  onBackground: Colors.black,
  onError: Colors.white,
  brightness: Brightness.light,
);

/// Custom color scheme for dark mode
const ColorScheme customDarkColorScheme = ColorScheme(
  primary: Color(0xFF48D1CC),           // Lighter Teal
  primaryContainer: Color(0xFF008080),  // Vibrant Teal
  secondary: Color(0xFFFFA07A),         // Lighter Coral
  secondaryContainer: Color(0xFFFF7F50), // Coral
  surface: Color(0xFF1E1E1E),           // Dark Grey
  background: Color(0xFF121212),        // Almost Black
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
    elevation: 4,
    titleTextStyle: GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: customLightColorScheme.background,
  cardTheme: CardTheme(
    color: customLightColorScheme.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  iconTheme: IconThemeData(color: customLightColorScheme.primary),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      color: customLightColorScheme.primary,
    ),
    bodyMedium: GoogleFonts.lato(
      color: Colors.black87,
      fontSize: 16,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: customLightColorScheme.primary, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: customLightColorScheme.onSecondary,
      backgroundColor: customLightColorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
    backgroundColor: customDarkColorScheme.surface,
    foregroundColor: customDarkColorScheme.onSurface,
    elevation: 4,
    titleTextStyle: GoogleFonts.roboto(
      fontSize: 22,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: customDarkColorScheme.background,
  cardTheme: CardTheme(
    color: customDarkColorScheme.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  iconTheme: IconThemeData(color: customDarkColorScheme.primary),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.roboto(
      fontWeight: FontWeight.bold,
      color: customDarkColorScheme.primary,
    ),
    bodyMedium: GoogleFonts.lato(
      color: Colors.white70,
      fontSize: 16,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: customDarkColorScheme.primary, width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: customDarkColorScheme.onSecondary,
      backgroundColor: customDarkColorScheme.secondary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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

 import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const lightPrimary = Color(0xFF2196F3);
  static const lightSecondary = Color(0xFF4CAF50);
  static const lightBackground = Color(0xFFFFFFFF);
  static const lightSurface = Color(0xFFF5F5F5);
  static const lightError = Color(0xFFF44336);

  // Dark Theme Colors
  static const darkPrimary = Color(0xFF90CAF9);
  static const darkSecondary = Color(0xFF81C784);
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1E1E1E);
  static const darkError = Color(0xFFEF5350);

  // Additional Colors
  static const cardShadow = Color(0x1A000000);
  static const disabledGrey = Color(0xFF9E9E9E);
  static const successGreen = Color(0xFF4CAF50);
  static const warningAmber = Color(0xFFFFC107);
  
  // Custom Color Schemes
  static final lightColorScheme = ColorScheme.light(
    primary: lightPrimary,
    secondary: lightSecondary,
    background: lightBackground,
    surface: lightSurface,
    error: lightError,
  );

  static final darkColorScheme = ColorScheme.dark(
    primary: darkPrimary,
    secondary: darkSecondary,
    background: darkBackground,
    surface: darkSurface,
    error: darkError,
  );
}

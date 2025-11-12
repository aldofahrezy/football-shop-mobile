import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF000000);
  static const Color background = Color(0xFFF9FAFB);
  static const Color foreground = Color(0xFF111827);
  static const Color muted = Color(0xFF6B7280);
  static const Color border = Color(0xFFE5E7EB);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color danger = Color(0xFFEF4444);
}

final ThemeData appTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.background,

  colorScheme: const ColorScheme(
    primary: AppColors.primary,
    onPrimary: AppColors.surface,
    secondary: AppColors.muted,
    onSecondary: AppColors.surface,
    surface: AppColors.surface,
    onSurface: AppColors.foreground,
    error: AppColors.danger,
    onError: AppColors.surface,
    brightness: Brightness.light,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.surface,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: AppColors.surface,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  cardTheme: CardThemeData(
    elevation: 0,
    color: AppColors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: AppColors.border, width: 1),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.border),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: AppColors.primary, width: 2),
    ),
    labelStyle: const TextStyle(color: AppColors.muted),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      textStyle: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.foreground,
      side: const BorderSide(color: AppColors.border),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  ),

  drawerTheme: const DrawerThemeData(backgroundColor: AppColors.surface),
);

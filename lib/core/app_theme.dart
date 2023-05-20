import 'package:flutter/material.dart';

class ColorsScheme {
  final Color primaryText;
  final Color secondaryText;
  final Color hintText;
  final Color background;
  final Color disabled;
  final Color accent;
  final Color border;
  final Color splash;

  ColorsScheme({
    required this.primaryText,
    required this.secondaryText,
    required this.hintText,
    required this.background,
    required this.disabled,
    required this.accent,
    required this.border,
    required this.splash,
  });
}

class AppTheme {
  static ColorsScheme colors = ColorsScheme(
    primaryText: const Color.fromRGBO(0, 0, 0, 1),
    secondaryText: const Color.fromRGBO(239, 201, 0, 1),
    hintText: const Color.fromRGBO(144, 144, 144, 1),
    background: const Color.fromRGBO(244, 244, 244, 1),
    disabled: const Color.fromRGBO(191, 191, 191, 1),
    accent: const Color.fromRGBO(250, 218, 49, 1),
    border: const Color.fromRGBO(53, 53, 53, 1),
    splash: const Color.fromRGBO(255, 248, 189, 0.71),
  );

  static ThemeData data = ThemeData(
    colorScheme: ColorScheme.light(background: colors.background),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: colors.accent,
      selectionColor: colors.splash,
    ),
  );
}

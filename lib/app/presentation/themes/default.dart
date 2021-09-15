import 'package:flutter/material.dart';

extension DefaultThemeExtension on ThemeData {
  Color _primaryColor() => const Color(0xFF6600CA);

  Color _secondaryColor() => const Color(0xFF00EAA1);

  ThemeData withColors() => copyWith(
      primaryColor: _primaryColor(),
      colorScheme: colorScheme.copyWith(
          primary: _primaryColor(), secondary: _secondaryColor()));
}

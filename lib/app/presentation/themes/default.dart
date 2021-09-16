import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension DefaultThemeExtension on ThemeData {
  Color _primaryColor() => const Color(0xFF6600CA);

  Color _secondaryColor() => const Color(0xFF00EAA1);

  ThemeData _withColors() => copyWith(
      primaryColor: _primaryColor(),
      colorScheme: colorScheme.copyWith(
        primary: _primaryColor(),
        secondary: _secondaryColor(),
      ));

  ThemeData _withNotoSans({final bool isDark = false}) => copyWith(
        // https://github.com/material-foundation/google-fonts-flutter/issues/67
        textTheme: GoogleFonts.notoSansTextTheme(
          ThemeData(
            brightness: (isDark ? Brightness.dark : Brightness.light),
          ).textTheme,
        ),
      );

  ThemeData withModifiers({final bool isDark = false}) =>
      (isDark ? ThemeData.dark() : ThemeData.light())
          ._withColors()
          ._withNotoSans(isDark: isDark);
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

extension DefaultThemeExtension on ThemeData {
  Color _purpleColor() => const Color(0xFF6600CA);

  Color _greenColor() => const Color(0xFF00EAA1);

  ThemeData _withColors({final bool isDark = false}) {
    final _primaryColor = isDark ? _greenColor() : _purpleColor();
    final _secondaryColor = isDark ? _purpleColor() : _greenColor();

    return copyWith(
        primaryColor: _primaryColor,
        colorScheme: colorScheme.copyWith(
          primary: _primaryColor,
          secondary: _secondaryColor,
        ));
  }

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
          ._withColors(isDark: isDark)
          ._withNotoSans(isDark: isDark);
}

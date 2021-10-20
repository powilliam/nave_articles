import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const purpleColor = Color(0xFF6600CA);
const greenColor = Color(0xFF00EAA1);

extension DefaultThemeExtension on ThemeData {
  ThemeData withColors({final bool isDark = false}) {
    final primaryColor = isDark ? greenColor : purpleColor;
    final secondaryColor = isDark ? purpleColor : greenColor;

    return copyWith(
        primaryColor: primaryColor,
        colorScheme: colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ));
  }

  ThemeData withNotoSans({final bool isDark = false}) => copyWith(
        // https://github.com/material-foundation/google-fonts-flutter/issues/67
        textTheme: GoogleFonts.notoSansTextTheme(
          ThemeData(
            brightness: (isDark ? Brightness.dark : Brightness.light),
          ).textTheme,
        ),
      );

  ThemeData withModifiers({final bool isDark = false}) =>
      (isDark ? ThemeData.dark() : ThemeData.light())
          .withColors(isDark: isDark)
          .withNotoSans(isDark: isDark);
}

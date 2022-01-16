import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FplTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.pacifico(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    subtitle1: GoogleFonts.pacifico(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    subtitle2: GoogleFonts.pacifico(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline1: GoogleFonts.pacifico(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.pacifico(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.pacifico(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.pacifico(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    subtitle1: GoogleFonts.pacifico(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    subtitle2: GoogleFonts.pacifico(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline1: GoogleFonts.pacifico(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.pacifico(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.pacifico(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red,
        secondary: Colors.redAccent,
        brightness: Brightness.light,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Colors.orange,
      ),
      textTheme: lightTextTheme,
    );
  }

  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.red[300],
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.red,
        secondary: Colors.redAccent,
        brightness: Brightness.dark,
      ),
      textTheme: darkTextTheme,
    );
  }
}

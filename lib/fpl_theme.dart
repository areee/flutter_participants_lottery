import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FplTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.cevicheOne(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    subtitle1: GoogleFonts.cevicheOne(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    subtitle2: GoogleFonts.cevicheOne(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline1: GoogleFonts.cevicheOne(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.cevicheOne(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.cevicheOne(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.cevicheOne(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    subtitle1: GoogleFonts.cevicheOne(
        fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
    subtitle2: GoogleFonts.cevicheOne(
        fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline1: GoogleFonts.cevicheOne(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.cevicheOne(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.cevicheOne(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
  );

  static light() {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color.fromRGBO(2, 48, 89, 1),
        secondary: Color.fromRGBO(60, 116, 166, 1),
        brightness: Brightness.light,
      ),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: Color.fromRGBO(2, 56, 89, 1),
      ),
      textTheme: lightTextTheme,
    );
  }

  static dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color.fromRGBO(2, 48, 89, 1),
      appBarTheme: AppBarTheme(
        backgroundColor: Color.fromRGBO(138, 161, 191, 1),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color.fromRGBO(2, 48, 89, 1),
        secondary: Color.fromRGBO(60, 116, 166, 1),
        brightness: Brightness.dark,
      ),
      textTheme: darkTextTheme,
    );
  }
}

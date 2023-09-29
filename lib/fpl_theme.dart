import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData fplTheme(Brightness brightness) {
  var baseTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: brightness,
    ),
    useMaterial3: true,
  );

  return baseTheme.copyWith(
      textTheme: GoogleFonts.robotoMonoTextTheme(baseTheme.textTheme));
}

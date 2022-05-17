import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightFplTheme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue, brightness: Brightness.light)
        .copyWith(secondary: Colors.yellowAccent[700]),
    textTheme: GoogleFonts.fredokaOneTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}

ThemeData darkFplTheme(BuildContext context) {
  return ThemeData(
    textTheme: GoogleFonts.fredokaOneTextTheme(
      Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    ),
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green, brightness: Brightness.dark)
        .copyWith(secondary: Colors.yellowAccent[700]),
  );
}

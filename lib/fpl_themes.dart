import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightFplTheme(BuildContext context) {
  return _lightWinter2023Theme(context);
}

ThemeData darkFplTheme(BuildContext context) {
  return _darkWinter2023Theme(context);
}

/// Winter 2023 theme for light mode.
ThemeData _lightWinter2023Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue, brightness: Brightness.light)
        .copyWith(secondary: Colors.greenAccent[700]),
    textTheme: GoogleFonts.robotoMonoTextTheme(
      Theme.of(context).textTheme.copyWith(
            headline3: const TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
            bodyText2: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
    ),
    useMaterial3: true,
  );
}

/// Winter 2023 theme for dark mode.
ThemeData _darkWinter2023Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue, brightness: Brightness.dark)
        .copyWith(secondary: Colors.greenAccent[700]),
    textTheme: GoogleFonts.robotoMonoTextTheme(
      Theme.of(context)
          .textTheme
          .copyWith(
            headline3: const TextStyle(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            bodyText1: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
            bodyText2: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
          .apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    ),
    useMaterial3: true,
  );
}

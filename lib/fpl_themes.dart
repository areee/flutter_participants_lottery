import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightFplTheme(BuildContext context) {
  return _lightChristmas2022Theme(context);
}

ThemeData darkFplTheme(BuildContext context) {
  return _darkChristmas2022Theme(context);
}

/// Christmas 2022 theme for light mode.
ThemeData _lightChristmas2022Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red, brightness: Brightness.light)
        .copyWith(secondary: Colors.greenAccent[700]),
    textTheme: GoogleFonts.mountainsOfChristmasTextTheme(
      Theme.of(context).textTheme.copyWith(
            headline3: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            bodyText1: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            bodyText2: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
    ),
    useMaterial3: true,
  );
}

/// Christmas 2022 theme for dark mode.
ThemeData _darkChristmas2022Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.red, brightness: Brightness.dark)
        .copyWith(secondary: Colors.greenAccent[700]),
    textTheme: GoogleFonts.mountainsOfChristmasTextTheme(
      Theme.of(context)
          .textTheme
          .copyWith(
            headline3: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            headline4: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            bodyText1: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
            bodyText2: const TextStyle(
              fontSize: 16.0,
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

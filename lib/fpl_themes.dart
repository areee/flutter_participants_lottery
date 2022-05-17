import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

ThemeData lightFplTheme(BuildContext context) {
  return DateTime.now().isAfter(firstSummer2022Day())
      ? _lightSummer2022Theme(context)
      : _lightSpring2022Theme(context);
}

ThemeData darkFplTheme(BuildContext context) {
  return DateTime.now().isAfter(firstSummer2022Day())
      ? _darkSummer2022Theme(context)
      : _darkSpring2022Theme(context);
}

/// Spring 2022 theme for light mode.
ThemeData _lightSpring2022Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green, brightness: Brightness.light)
        .copyWith(secondary: Colors.yellowAccent[700]),
    textTheme: GoogleFonts.fredokaOneTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}

/// Spring 2022 theme for dark mode.
ThemeData _darkSpring2022Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.green, brightness: Brightness.dark)
        .copyWith(secondary: Colors.yellowAccent[700]),
    textTheme: GoogleFonts.fredokaOneTextTheme(
      Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    ),
  );
}

/// Summer 2022 theme for light mode.
ThemeData _lightSummer2022Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.amber, brightness: Brightness.light)
        .copyWith(secondary: Colors.indigoAccent[700]),
    textTheme: GoogleFonts.fredokaOneTextTheme(
      Theme.of(context).textTheme,
    ),
  );
}

/// Summer 2022 theme for dark mode.
ThemeData _darkSummer2022Theme(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.amber, brightness: Brightness.dark)
        .copyWith(secondary: Colors.indigoAccent[700]),
    textTheme: GoogleFonts.fredokaOneTextTheme(
      Theme.of(context).textTheme.apply(
            bodyColor: Colors.white,
            displayColor: Colors.white,
          ),
    ),
  );
}

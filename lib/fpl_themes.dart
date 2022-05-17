import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightFplTheme(BuildContext context) {
  return _lightSpring2022Theme(context);
}

ThemeData darkFplTheme(BuildContext context) {
  return _darkSpring2022Theme(context);
}

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

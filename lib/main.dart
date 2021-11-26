import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        brightness: Brightness.light, primaryColor: Colors.lightGreen);

    final ThemeData darkTheme =
        ThemeData(brightness: Brightness.dark, primaryColor: Colors.lightGreen);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.white)),
      darkTheme: darkTheme.copyWith(
          colorScheme: darkTheme.colorScheme.copyWith(secondary: Colors.black)),
      home: HomePage(title: 'Osallistujien arvonta'),
    );
  }
}

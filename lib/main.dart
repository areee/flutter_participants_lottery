import 'package:flutter/material.dart';
import 'home_page.dart';
import 'fpl_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      theme: FplTheme.light(),
      darkTheme: FplTheme.dark(),
      home: const HomePage(title: 'Osallistujien arvonta'),
    );
  }
}

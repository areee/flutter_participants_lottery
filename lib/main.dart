import 'package:flutter/material.dart';
import 'fpl_themes.dart';
import 'home_page.dart';

void main() {
  runApp(const FplApp());
}

class FplApp extends StatelessWidget {
  const FplApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      darkTheme: darkFplTheme(context),
      theme: lightFplTheme(context),
      home: const HomePage(title: 'Hyvää joulua!'),
    );
  }
}

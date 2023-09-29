import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/pages/about_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/app_bar_text.dart';
import 'fpl_theme.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const FplApp());
}

class FplApp extends StatelessWidget {
  const FplApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(title: getAppBarText()),
        ),
        GetPage(
          name: '/about',
          page: () => const About(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      darkTheme: fplTheme(Brightness.dark),
      theme: fplTheme(Brightness.light),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'components/app_bar_text.dart';
import 'fpl_themes.dart';
import 'pages/home_page.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const FplApp());
}

class FplApp extends StatelessWidget {
  const FplApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => Home(title: getAppBarText()),
        ),
        // GetPage(
        //   name: '/settings',
        //   page: () => const Settings(),
        // ),
        // GetPage(
        //   name: '/about',
        //   page: () => const About(),
        // ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Osallistujien arvonta',
      darkTheme: darkFplTheme(context),
      theme: lightFplTheme(context),
    );
  }
}

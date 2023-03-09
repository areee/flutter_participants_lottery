import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/components/settings_dialog.dart';
import 'package:get/get.dart';

List<Widget> appBarActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.settings),
      tooltip: 'Asetukset',
      onPressed: () {
        settingsDialog(context);
      },
    ),
    IconButton(
      icon: const Icon(Icons.info),
      tooltip: 'Tietoja sovelluksesta',
      onPressed: () {
        Get.toNamed('/about');
      },
    ),
  ];
}

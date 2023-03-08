import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:flutter_participants_lottery/extensions/string_extension.dart';
import 'package:flutter_participants_lottery/extensions/string_list_extension.dart';
import 'package:get/get.dart';

void settingsDialog(BuildContext context) {
  final Controller c = Get.find();
  final timerDurationController =
      TextEditingController(text: c.timerDuration.value.toString());
  final participantNamesController = TextEditingController(
      text: c.participantNames.toList().listIntoCommaSeparatedString());
  final formKey = GlobalKey<FormState>();
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Asetukset',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    controller: timerDurationController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: const InputDecoration(
                      labelText: 'Ajastimen kesto sekunteina',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Syötä sekuntit';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 350,
                  child: TextFormField(
                    controller: participantNamesController,
                    style: Theme.of(context).textTheme.bodyLarge,
                    decoration: const InputDecoration(
                      labelText: 'Syötä nimet, erottele pilkuilla',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Syötä vähintään yksi nimi';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Peruuta',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            TextButton(
              child: Text(
                'Tallenna',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  c.setTimerDuration(int.parse(timerDurationController.text));

                  c.setParticipantNames(participantNamesController.text
                      .commaSeparatedStringIntoList());

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Asetukset tallennettu')),
                  );

                  Get.back();
                }
              },
            ),
          ],
        );
      });
}

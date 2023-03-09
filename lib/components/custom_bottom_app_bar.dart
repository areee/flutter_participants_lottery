import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(context) {
    final Controller c = Get.find();

    return BottomAppBar(
      notchMargin: 8,
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).colorScheme.primary,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: <Widget>[
            const Spacer(
              flex: 3,
            ),
            Obx(() => IconButton(
                  tooltip: 'Arvo (${c.participantNames.length} kpl)',
                  icon: const Icon(Icons.shuffle),
                  onPressed: () {
                    c.mixParticipantNames();
                  },
                )),
            const Spacer(
              flex: 1,
            ),
            IconButton(
              tooltip: 'Pysäytä',
              icon: const Icon(Icons.stop),
              onPressed: () {
                c.setStopped();
              },
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

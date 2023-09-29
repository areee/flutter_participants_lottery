import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(context) {
    final Controller c = Get.find();

    return BottomAppBar(
      height: 60,
      notchMargin: 4,
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
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
    );
  }
}

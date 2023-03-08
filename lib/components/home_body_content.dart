import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/components/avatar_widget.dart';
import 'package:flutter_participants_lottery/components/custom_circular_count_down_timer.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:get/get.dart';

class HomePageBodyContent extends StatelessWidget {
  const HomePageBodyContent({
    super.key,
    required this.controller,
    required this.axisCount,
  });

  final Controller controller;
  final int axisCount;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const CustomCircularCountDownTimer(),
            const SizedBox(height: 20),
            Obx(() => controller.participantNames.toList().isNotEmpty
                ? GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: axisCount,
                    children: controller.participantNames
                        .map((name) => AvatarWidget(name: name))
                        .toList(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Vinkki: lisää osallistujat oikean yläkulman asetukset-napista!',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  )),
          ],
        ),
      ),
    );
  }
}

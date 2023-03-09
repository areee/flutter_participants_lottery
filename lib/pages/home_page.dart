import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/components/custom_app_bar.dart';
import 'package:flutter_participants_lottery/components/custom_bottom_app_bar.dart';
import 'package:flutter_participants_lottery/components/home_app_bar_actions.dart';
import 'package:flutter_participants_lottery/components/home_body_content.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:flutter_participants_lottery/static.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    final ac = (MediaQuery.of(context).size.width / 140).round();

    return Scaffold(
      appBar: customAppBar(context, title, appBarActions(context)),
      body: HomePageBodyContent(controller: c, axisCount: ac),
      floatingActionButton: Obx(() => FloatingActionButton(
            onPressed: () {
              c.timerStatus.value == TimerStatus.running
                  ? c.setPaused()
                  : c.setRunning();
            },
            tooltip: c.timerStatus.value == TimerStatus.running
                ? 'Tauko'
                : 'Käynnistä',
            child: Icon(
              c.timerStatus.value == TimerStatus.running
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}

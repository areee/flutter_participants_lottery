import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:emoji_alert/arrays.dart';
import 'package:emoji_alert/emoji_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_participants_lottery/controllers/controller.dart';
import 'package:flutter_participants_lottery/static.dart';
import 'package:get/get.dart';

class CustomCircularCountDownTimer extends StatelessWidget {
  const CustomCircularCountDownTimer({super.key});

  @override
  Widget build(context) {
    final Controller c = Get.find();

    return CircularCountDownTimer(
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      duration: c.timerDuration.value,
      initialDuration: 0,
      fillColor: Theme.of(context).colorScheme.primary,
      ringColor: Colors.grey[300]!,
      controller: c.countDownController.value,
      ringGradient: null,
      fillGradient: null,
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: Theme.of(context).textTheme.displayMedium,
      textFormat: CountdownTextFormat.MM_SS,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: false,
      onComplete: () {
        if (c.timerStatus.value == TimerStatus.running) {
          c.timerStatus.value = TimerStatus.stopped;
          showEmojiAlert(context);
        }
      },
    );
  }

  void showEmojiAlert(BuildContext context) {
    EmojiAlert(
        emojiType: EMOJI_TYPE.WINK,
        background: Theme.of(context).colorScheme.background,
        enableMainButton: true,
        mainButtonText: Text(
          'Sulje',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
        ),
        mainButtonColor: Theme.of(context).colorScheme.primary,
        secondaryButtonColor: Theme.of(context).colorScheme.secondary,
        onMainButtonPressed: () {
          Get.back();
        },
        description: Column(
          children: [
            Text(
              'Aika loppui',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        )).displayAlert(context);
  }
}

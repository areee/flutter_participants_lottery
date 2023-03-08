import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_participants_lottery/static.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Controller extends GetxController {
  final timerStatus = TimerStatus.stopped.obs;
  final countDownController = CountDownController().obs;
  final timerDuration = 90.obs;
  final participantNames = <String>[].obs;

  final box = GetStorage();

  @override
  onInit() {
    super.onInit();
    _initializeTimerDuration();
    _initializeParticipantNames();
  }

  _initializeTimerDuration() {
    if (box.read('timerDuration') != null) {
      timerDuration.value = box.read('timerDuration');
    }
  }

  _initializeParticipantNames() {
    if (box.read('participantNames') != null) {
      participantNames.value = box.read('participantNames');
    }
  }

  setTimerDuration(int value) {
    setStopped();
    timerDuration.value = value;
    box.write('timerDuration', value);
  }

  addParticipantName(String value) {
    participantNames.add(value);
    box.write('participantNames', participantNames);
  }

  removeParticipantName(String value) {
    participantNames.remove(value);
    box.write('participantNames', participantNames);
  }

  setParticipantNames(List<String> value) {
    participantNames.value = value;
    box.write('participantNames', participantNames);
  }

  setRunning() {
    if (kDebugMode) {
      print('setRunning');
    }
    if (timerStatus.value == TimerStatus.stopped) {
      countDownController.value.restart(duration: timerDuration.value);
    } else {
      countDownController.value.resume();
    }
    timerStatus.value = TimerStatus.running;
  }

  setPaused() {
    if (kDebugMode) {
      print('setPaused');
    }
    timerStatus.value = TimerStatus.paused;
    countDownController.value.pause();
  }

  setStopped() {
    if (kDebugMode) {
      print('setStopped');
    }
    timerStatus.value = TimerStatus.stopped;
    countDownController.value.restart(duration: 0);
    countDownController.value.pause();
  }
}

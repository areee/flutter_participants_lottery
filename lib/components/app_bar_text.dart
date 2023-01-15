import 'package:flutter_participants_lottery/extensions/string_extension.dart';
import 'package:flutter_participants_lottery/static.dart';

/// Returns the text for the app bar
String getAppBarText() {
  var adjective = getAdjective();
  var weekDay = getWeekDay(DateTime.now().weekday - 1);
  return '${adjective.toCapitalized()} $weekDay';
}

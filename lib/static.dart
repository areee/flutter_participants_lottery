import 'dart:math';

/// Returns days of the week in Finnish
List<String> weekDays = [
  'maanantaita',
  'tiistaita',
  'keskiviikkoa',
  'torstaita',
  'perjantaita',
  'lauantaita',
  'sunnuntaita',
];

/// Returns the day of the week in Finnish
String getWeekDay(int day) {
  return weekDays[day];
}

/// Returns adjectives in Finnish
List<String> adjectives = [
  'iloista',
  'onnellista',
  'rauhallista',
  'raikasta',
  'mukavaa',
  'aurinkoista',
  'lämminhenkistä',
  'vähäbugista',
  'kätevää',
  'käyttäjäystävällistä',
  'joustavaa',
  'tehokasta',
  'loogista',
  'järkevää',
  'tarkkaa',
  'yksinkertaista',
  'selkeää',
  'helppoa',
];

/// Returns a random adjective
String getAdjective() {
  return adjectives[Random().nextInt(adjectives.length)];
}

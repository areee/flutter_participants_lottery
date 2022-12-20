import 'package:flutter_participants_lottery/extensions/string_extension.dart';

List<String> runLotteryList(List<String> names) {
  names = names.map((e) => e.trimAndReplaceDoubleSpaces()).toList();
  // Shuffle (randomize) the names
  names.shuffle();
  return names;
}

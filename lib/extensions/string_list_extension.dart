import 'package:flutter_participants_lottery/extensions/string_extension.dart';

extension StringListExtension on List<String> {
  /// Converts a list into a comma separated string
  String listIntoCommaSeparatedString() {
    var sb = StringBuffer();
    for (var i = 0; i < length; ++i) {
      var listItem = this[i];
      sb.write(i != length - 1 ? '$listItem, ' : listItem);
    }
    return sb.toString();
  }

  /// Runs the lottery on a list of names
  List<String> runLotteryList() {
    if (isEmpty) {
      return this;
    }
    map((e) => e.trimAndReplaceDoubleSpaces()).toList();
    // Shuffle (randomize) the names
    shuffle();
    return this;
  }
}

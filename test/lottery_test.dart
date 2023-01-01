import 'package:flutter_participants_lottery/extensions/string_list_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Lottery list gives names in another ordered list', () {
    var names = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z'
    ];
    var names2 = names.toList();
    expect(names2.runLotteryList(), isNot(names));
  });

  test('Empty list gives empty list', () {
    var names = <String>[];
    var names2 = names.toList();
    expect(names2.runLotteryList(), names);
  });
}

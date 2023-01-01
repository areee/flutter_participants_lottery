import 'package:flutter_participants_lottery/extensions/string_extension.dart';
import 'package:flutter_participants_lottery/extensions/string_list_extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('String with commas comes out as a list', () {
    const stringWithCommas = 'a, b, c, d';
    const list = ['a', 'b', 'c', 'd'];
    expect(stringWithCommas.commaSeparatedStringIntoList(), list);
  });

  test('String with commas and too much whitespaces comes out as a list', () {
    const stringWithCommas = 'a,   b,   c,   d';
    const list = ['a', 'b', 'c', 'd'];
    expect(stringWithCommas.commaSeparatedStringIntoList(), list);
  });

  test('String list comes out as a String with commas', () {
    const stringWithCommas = 'a, b, c, d';
    const list = ['a', 'b', 'c', 'd'];
    expect(list.listIntoCommaSeparatedString(), stringWithCommas);
  });

  test('Empty String comes out as an empty String list', () {
    const emptyString = '';
    const emptyList = <String>[];
    expect(emptyString.commaSeparatedStringIntoList(), emptyList);
  });
}

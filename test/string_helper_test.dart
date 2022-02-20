import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_participants_lottery/src/string_helper.dart'
    as string_helper;

void main() {
  test("String with commas comes out as a list", () {
    const stringWithCommas = 'a, b, c, d';
    const list = ['a', 'b', 'c', 'd'];

    expect(string_helper.commaSeparatedStringIntoList(stringWithCommas), list);
  });

  test("String with commas and too much whitespaces comes out as a list", () {
    const stringWithCommas = 'a,   b,   c,   d';
    const list = ['a', 'b', 'c', 'd'];

    expect(string_helper.commaSeparatedStringIntoList(stringWithCommas), list);
  });

  test("String list comes out as a string with commas", () {
    const stringWithCommas = 'a, b, c, d';
    const list = ['a', 'b', 'c', 'd'];

    expect(string_helper.listIntoCommaSeparatedString(list), stringWithCommas);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_participants_lottery/src/string_helper.dart'
    as stringHelper;

void main() {
  test("String with commas comes out as a list", () {
    const stringWithCommas = 'a, b, c, d';
    const list = ['a', 'b', 'c', 'd'];

    expect(stringHelper.commaSeparatedStringIntoList(stringWithCommas), list);
  });

  test("String with commas and too much whitespaces comes out as a list", () {
    const stringWithCommas = 'a,   b,   c,   d';
    const list = ['a', 'b', 'c', 'd'];

    expect(stringHelper.commaSeparatedStringIntoList(stringWithCommas), list);
  });

  test("String list comes out as a string with commas", () {
    const stringWithCommas = 'a, b, c, d';
    const list = ['a', 'b', 'c', 'd'];

    expect(stringHelper.listIntoCommaSeparatedString(list), stringWithCommas);
  });
}

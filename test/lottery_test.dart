import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_participants_lottery/src/lottery_logic.dart' as lottery;

void main() {
  test("Lottery list gives names in another ordered list", () {
    const names = ['a', 'b', 'c', 'd'];
    expect(lottery.runLotteryList(names), isNot(names));
  });

  test("Empty list gives empty list", () {
    const names = <String>[];
    expect(lottery.runLotteryList(names), names);
  });
}

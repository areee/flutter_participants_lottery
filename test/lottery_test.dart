import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_participants_lottery/src/lottery_logic.dart' as lottery;

void main() {
  test("Lottery list gives names in another order", () {
    const names = ['a', 'b', 'c', 'd'];

    expect(lottery.runLotteryList(names), isNot('a, b, c, d'));
  });

  test("Lottery list gives names in another ordered list", () {
    const names = ['a', 'b', 'c', 'd'];

    expect(lottery.runLotteryListReturnList(names), isNot(names));
  });

  test("Lottery string gives names in another ordered string", () {
    const names = 'a, b, c, d';

    expect(lottery.runLottery(names), isNot('a, b, c, d'));
  });
}

import 'dart:math';

String runLottery(String names) {
  return runLotteryList(names.split(','));
}

String runLotteryList(List<String> names) {
  var reOrderedList = <int>[];

  var random = Random();

  while (reOrderedList.length != names.length) {
    var randomNumber = random.nextInt(names.length);

    if (!reOrderedList.contains(randomNumber)) {
      reOrderedList.add(randomNumber);
    }
  }

  var returnedString = '';

  for (var i = 0; i < reOrderedList.length; i++) {
    if (i == 0) {
      returnedString = '${names[reOrderedList[i]]}';
    } else {
      returnedString = '$returnedString, ${names[reOrderedList[i]]}';
    }
  }
  return returnedString.replaceAll('  ', ' ');
}

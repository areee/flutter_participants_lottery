/// A helper that converts a [commaSeparatedString] into String list.
List<String> commaSeparatedStringIntoList(String commaSeparatedString) {
  commaSeparatedString = commaSeparatedString.replaceAll(RegExp(r'\s+'), '');
  var returnedList = commaSeparatedString.split(',');
  return returnedList;
}

/// A helper that converts a [stringList] into String.
String listIntoCommaSeparatedString(List<String> stringList) {
  var sb = StringBuffer();

  for (var i = 0; i < stringList.length; ++i) {
    var listItem = stringList[i];
    sb.write(i != stringList.length - 1 ? '$listItem, ' : listItem);
  }
  return sb.toString();
}

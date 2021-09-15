/// A helper that converts a [commaSeparatedString] into String list.
List<String> commaSeparatedStringIntoList(String commaSeparatedString) {
  commaSeparatedString = commaSeparatedString.replaceAll(RegExp(r'\s+'), '');
  var returnedList = commaSeparatedString.split(',');
  return returnedList;
}

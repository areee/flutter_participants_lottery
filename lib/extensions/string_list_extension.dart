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
}

extension StringExtension on String {
  /// Trims and replaces double or more spaces with one space
  String trimAndReplaceDoubleSpaces() {
    return trim().replaceAll(RegExp(r'\s{2,}'), ' ');
  }
}

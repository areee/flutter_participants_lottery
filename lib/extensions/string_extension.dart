extension StringExtension on String {
  /// Trims and replaces double or more spaces with one space
  String trimAndReplaceDoubleSpaces() {
    return trim().replaceAll(RegExp(r'\s{2,}'), ' ');
  }

  /// Returns a string with the first letter capitalized and the rest lowercased
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
}

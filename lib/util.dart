bool isDigit(String s, int idx) => (s.codeUnitAt(idx) ^ 0x30) <= 9;

extension StringExtension on String {
  String toCamelCase() {
    if (isEmpty) {
      return '';
    }

    final parts = split(RegExp(r'[_\s-]+')); // Split by underscore, space, or hyphen
    final buffer = StringBuffer();

    for (final part in parts) {
      if (part.isNotEmpty) {
        if (buffer.isEmpty) { // First word
          buffer.write(part[0].toLowerCase() + part.substring(1));
        } else { // Subsequent words
          buffer.write(part[0].toUpperCase() + part.substring(1));
        }
      }
    }

    return buffer.toString();
  }
}

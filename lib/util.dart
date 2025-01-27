String camelCase(String input) => input.isNotEmpty ? input[0].toLowerCase() + input.substring(1) : input;

bool isDigit(String s, int idx) => (s.codeUnitAt(idx) ^ 0x30) <= 9;

import 'dart:io';

import 'package:dart_style/dart_style.dart';

RegExp openingBracket = RegExp(r"[<(]");
RegExp closingBracket = RegExp(r"[>)]");

class FFINatives {
  final List<FFIFunction> functions = [];

  FFINatives.fromFile(String path) {
    var file = File(path);
    if (!file.existsSync()) throw Exception("File not found: $path");
    var lines = DartFormatter(pageWidth: 9223372036854775807).format(file.readAsStringSync());

    bool nextLateFinalIsRightBeforeFunction = false;
    bool nextEmptyLinePrecedesAFunction = false;
    bool thisLineIsAFunction = false;
    bool collectingArgs = false;
    int argNestLevel = 0;
    String currentFunctionLine = "";
    List<FFIArgument> currentArgs = [];
    String currentArgLine = "";
    for (var (i, line) in lines.split("\n").indexed) {
      var trimmed = line.trim();
      if (trimmed.startsWith("//")) continue;
      if (collectingArgs) {
        if (line.startsWith("  ) {")) {
          print("  it has ${currentArgs.length} argument${currentArgs.length == 1 ? "" : "s"}");
          functions.add(FFIFunction.fromLine(currentFunctionLine, currentArgs));
          collectingArgs = false;
        } else {
          argNestLevel += openingBracket.allMatches(trimmed).length - closingBracket.allMatches(trimmed).length;
          currentArgLine += trimmed;
          if (argNestLevel > 0 || !currentArgLine.endsWith(",")) {
          } else {
            currentArgs.add(FFIArgument.fromLine(currentArgLine));
            currentArgLine = "";
          }
        }
      } else if (thisLineIsAFunction) {
        if (trimmed.startsWith("enum") || trimmed.startsWith("final class ")) {
          print("found non function on line ${i + 1}, assuming we are done");
          break;
        }
        print('we found a function on line ${i + 1}: "$trimmed"');
        currentFunctionLine = trimmed;
        if (trimmed.endsWith("() {")) {
          print("  it has no arguments");
          functions.add(FFIFunction.fromLine(trimmed, []));
        } else {
          currentFunctionLine = trimmed;
          collectingArgs = true;
          currentArgs = [];
          currentArgLine = "";
        }
        thisLineIsAFunction = false;
      } else if (nextEmptyLinePrecedesAFunction) {
        if (trimmed.isEmpty) {
          thisLineIsAFunction = true;
          nextEmptyLinePrecedesAFunction = false;
        }
      } else if (line.startsWith("  late final")) {
        if (nextLateFinalIsRightBeforeFunction) nextEmptyLinePrecedesAFunction = true;
        nextLateFinalIsRightBeforeFunction = !nextLateFinalIsRightBeforeFunction;
      }
    }
  }
}

class FFIFunction {
  late final String name;
  late final String returnType;
  final List<FFIArgument> arguments;

  FFIFunction(this.name, this.returnType, this.arguments);

  FFIFunction.fromLine(String line, this.arguments) {
    var split = line.trim().split(RegExp(r"\s+"));
    returnType = split[0];
    name = split[1].substring(0, split[1].lastIndexOf("("));
  }
}

class FFIArgument {
  late final String name;
  late final String type;

  FFIArgument(this.name, this.type);

  FFIArgument.fromLine(String line) {
    var trimmed = line.trim();
    print("parsing argument from line: $trimmed");
    name = trimmed.substring(trimmed.lastIndexOf(" ") + 1, trimmed.length - 1);
    type = trimmed.substring(0, trimmed.lastIndexOf(" "));
  }
}

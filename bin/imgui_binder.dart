import 'dart:io';
import 'dart:ffi';

import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart' show DartFormatter;
import 'package:imgui_binder/TypeInfo.dart';
import 'package:imgui_binder/dart_writer.dart';
import 'package:imgui_binder/ffiNatives.dart';
import 'package:imgui_binder/imgui_definitions.dart';
import 'package:imgui_binder/util.dart';
import 'package:ffi/ffi.dart';

const String nativeCallsPath = "lib/cimgui.g.dart";
const String outputDir = "lib/generated";
const String outputFile = "dimgui";

void main(List<String> args) {
  if (!Directory(outputDir).existsSync()) Directory(outputDir).createSync();

  print("Parsing ffiGened file...");
  var natives = FFINatives.fromFile(nativeCallsPath);
  var defs = ImGuiDefinitions()..loadFrom("resources/definitions/cimgui");

  print("Generating bindings...");

  var writer = DartWriter();

  writer
    ..import("dart:io")
    ..import("dart:ffi", "as ffi")
    ..writeln()
    ..import("package:ffi/ffi.dart")
    ..writeln()
    ..import("../cimgui.g.dart")
    ..writeln();

  generateInitializer(writer);

  for (var func in natives.functions) {
    OverloadDefinition? def;
    bool defaultsStarted = false;

    String fixDefault(String def) {
      if (wellKnownDefaultValues.containsKey(def)) return wellKnownDefaultValues[def]!;
      if(num.tryParse(def.substring(0, def.length - 1)) != null) return num.tryParse(def.substring(0, def.length - 1)).toString();
      return def;
    }

    //TODO: fix this
    //pointers with null defaults should be nullable and then have a null check which passes nullptr
    //also everything else
    void writeArg(FFIArgument arg, String type) {
      var isLast = func.arguments.last == arg;
      String toWrite = arg.name.toCamelCase();
      var startingBracket = false;
      var endingBracket = defaultsStarted && isLast;
      if (def != null && def.defaultValues.containsKey(arg.name)) {
        var defaultVal = fixDefault(def.defaultValues[arg.name]!);
        if (defaultVal == "null") {
          toWrite = "? $toWrite";
        } else {
          toWrite = " $toWrite = $defaultVal";
        }
        if (!defaultsStarted) startingBracket = true;
        defaultsStarted = !isLast;
        if (isLast) endingBracket = true;
      } else {
        toWrite = " $toWrite";
      }
      toWrite = "${startingBracket ? "[" : ""}$type$toWrite,${endingBracket ? "]" : ""}";
      writer.writeln(toWrite);
    }

    for (var f in defs.functions) {
      for (var o in f.overloads) {
        if (o.exportedName == func.name) {
          def = o;
          break;
        }
      }
    }

    if (func.arguments.any((arg) => invalidTypes.contains(arg.type))) {
      print("Skipping ${func.name} due to invalid type");
      continue;
    }

    var preCall = DartWriter();
    var postCall = DartWriter();
    var funcName = fixName(func);
    var funcReturnType = fixReturnType(func);

    writer
      ..writeln("$funcReturnType $funcName(")
      ..indent();

    var coerced = List<bool>.filled(func.arguments.length, false);

    for (var (i, arg) in func.arguments.indexed) {
      var camel = arg.name.toCamelCase();
      switch (arg.type) {
        case "ffi.Pointer<ffi.Char>":
          preCall.writeln("final ${arg.type} _$camel = $camel.toNativeUtf8().cast()");
          // postCall.writeln("free(_${arg.name});"); how do i free this?
          writeArg(arg, "String");
          coerced[i] = true;
        default:
          writeArg(arg, arg.type);
      }
    }

    var isVoid = funcReturnType == "void";

    writer
      ..unindent()
      ..pushBlock(")");

    if (!isVoid) writer.writeln("$funcReturnType ret;");

    writer.writeWriter(preCall);

    writer
      ..writeln("${isVoid ? "" : "ret = "}_cimgui.${func.name}(")
      ..indent();
    for (var (i, arg) in func.arguments.indexed) {
      writer.writeln("${coerced[i] ? "_" : ""}${arg.name.toCamelCase()},");
    }
    writer
      ..unindent()
      ..writeln(");")
      ..writeWriter(postCall);

    if (!isVoid) writer.writeln("return ret;");

    writer
      ..popBlock()
      ..writeln();
  }

  formatAndWrite(writer, "$outputDir/$outputFile.g.dart");
}

String fixName(FFIFunction func) {
  var ret = func.name;

  if (ret.startsWith("ig")) {
    ret = ret.replaceFirst("ig", "");
  }
  return ret.toCamelCase();
}

String fixReturnType(FFIFunction func) {
  var ret = func.returnType;

  // for (var arg in func.arguments) {
  //   if (arg.name == "pOut") {
  //     ret = arg.type;
  //   }
  // }
  return ret;
}

void generateInitializer(DartWriter writer) {
  print("Generating Initializer...");
  writer
    ..beginRegion("Init")
    ..pushBlock("cImgui _initialize(String path)")
    ..pushBlock("var dll = switch (Platform.operatingSystem)")
    ..writeln('"windows" => "\$path.dll",')
    ..writeln('"macos" => "\$path.dylib",')
    ..writeln('"linux" => "\$path.so",')
    ..writeln('_ => throw Exception("Unsupported platform \${Platform.operatingSystem}"),')
    ..popBlock(";")
    ..writeln()
    ..writeln("return cImgui(ffi.DynamicLibrary.open(dll));")
    ..popBlock()
    ..writeln()
    ..writeln('final _cimgui = _initialize("resources/imgui/cimgui");')
    ..endRegion()
    ..writeln();
  print("");
}

void formatAndWrite(DartWriter writer, String path) {
  File file = File(path);

  print("Formatting output...");
  var out = writer.content.toString();
  try {
    // out = DartFormatter().format(out);
  } catch (e) {
    print("Failed to format output: $e");
  }
  print("Writing to file ${file.path}...");
  file.writeAsStringSync(out);
}

import 'dart:io';

import 'package:dart_style/dart_style.dart' show DartFormatter;
import 'package:imgui_binder/TypeInfo.dart';
import 'package:imgui_binder/dart_writer.dart';
import 'package:imgui_binder/imgui_definitions.dart';
import 'package:imgui_binder/util.dart';

Map<String, SupportedLibrary> libs = {
  "cimgui": SupportedLibrary(name: "DimGui", classPrefix: "ImGui", dllName: "cimgui", referencesImGui: false),
  "cimplot": SupportedLibrary(name: "DimPlot", classPrefix: "ImPlot", dllName: "cimplot"),
  "cimnodes": SupportedLibrary(name: "DimNodes", classPrefix: "ImNodes", dllName: "cimnodes"),
  "cimguizmo": SupportedLibrary(name: "DimGuizmo", classPrefix: "ImGuizmo", dllName: "cimguizmo"),
};

SupportedLibrary lib = libs["cimgui"]!;
ImGuiDefinitions defs = ImGuiDefinitions();

void main(List<String> args) {
  if (args.isNotEmpty && libs.containsKey(args[0])) {
    lib = libs[args[0]]!;
    print("Generating bindings for ${lib.name}...");
  } else if (args.isNotEmpty) {
    print("Unsupported library: ${args[0]}");
    return;
  }

  String outputDir = "out";
  if (args.length > 1) outputDir = args[1];

  if (!Directory(outputDir).existsSync()) Directory(outputDir).createSync();

  String defsPath = "resources/definitions/${lib.dllName}";
  defs.loadFrom(defsPath);

  print("Definitions loaded Successfully!");
  print("Generating bindings...");

  var writer = DartWriter();

  writer
    ..import("dart:io")
    ..import("dart:ffi")
    ..writeln();

  generateInitializer(writer);

  generateFunctions(writer);

  generateTypes(writer);

  generateEnums(writer);

  File file = File("$outputDir/${camelCase(lib.name)}.g.dart");

  print("Formatting output...");
  var out = writer.content.toString();
  try {
    out = DartFormatter().format(out);
  } catch (e) {
    print("Failed to format output: $e");
  }
  print("Writing to file ${file.path}...");
  file.writeAsStringSync(out);
}

void generateInitializer(DartWriter writer) {
  print("Generating Initializer...");
  writer
    ..writeln("//region Init")
    ..pushBlock("DynamicLibrary initialize${lib.classPrefix}(String path) {")
    ..pushBlock("var dll = switch (Platform.operatingSystem)")
    ..writeln('"windows" => "\$path.dll",')
    ..writeln('"macos" => "\$path.dylib",')
    ..writeln('"linux" => "\$path.so",')
    ..writeln('_ => throw Exception("Unsupported platform \${Platform.operatingSystem}"),')
    ..popBlock(";")
    ..writeln()
    ..writeln("return DynamicLibrary.open(dll);")
    ..popBlock()
    ..writeln()
    ..writeln("final _${lib.dllName} = initialize${lib.classPrefix}();")
    ..writeln("//endregion")
    ..writeln();
  print("");
}

void generateFunctions(DartWriter writer) {
  print("Generating Functions...");
  writer.writeln("//region Functions");
  for (var func in defs.functions) {
    print("Generating function: ${func.name}");

    for (var overload in func.overloads) {
      String exportedName = overload.exportedName;
      if (exportedName.contains("~")) {
        continue;
      }
      if (exportedName.contains("ImVector_")) {
        continue;
      }
      if (exportedName.contains("ImChunkStream_")) {
        continue;
      }

      String ret = getTypeString(overload.returnType, false);

      bool hasVarArg = false;
      List<String> paramParts = [];
      List<String> cParamParts = [];
      List<String> dartParamParts = [];
      for (int i = 0; i < overload.parameters.length; i++) {
        var p = overload.parameters[i];

        String pType = getTypeString(p.type, p.isFunctionPointer);

        if (pType == "va_list") {
          hasVarArg = true;
          break;
        }

        if (p.arraySize != 0) pType += "*";

        if (p.name == "...") continue;

        String identifier = identifierReplacements[p.name] ?? p.name;
        paramParts.add(identifier);
        cParamParts.add("${isEnum(pType) ? "Uint32" : mapFFIType(pType)} $identifier");
        dartParamParts.add("${isEnum(pType) ? "int" : mapIntegralType(pType)} $identifier");
      }

      if (hasVarArg) continue;

      var params = paramParts.join(", ");
      var cParams = cParamParts.join(", ");
      var dartParams = dartParamParts.join(", ");

      bool isUdt = exportedName.contains("nonUDT");
      var methodName = isUdt ? exportedName.substring(0, exportedName.indexOf("_nonUDT")) : exportedName;

      var friendly = camelCase(overload.friendlyName);

      writer
        ..writeln("///```c")
        ..writeln("/// $ret $friendly(");
      for (int j = 0; j < overload.parameters.length; j++) {
        var p = overload.parameters[j];
        writer.writeln("///   ${getTypeString(p.type, p.isFunctionPointer)} ${identifierReplacements[p.name] ?? p.name} ${(j == overload.parameters.length - 1 ? "" : ",")}");
      }
      writer
        ..writeln("/// );")
        ..writeln("///```")
        ..writeln("${(isEnum(ret) ? "int" : mapIntegralType(ret))} $friendly($dartParams) =>")
        ..indent()
        ..writeln("_$methodName($params);")
        ..unindent()
        ..writeln()
        ..writeln("late final _$methodName = _${lib.dllName}.lookupFunction<")
        ..indent()
        ..writeln("${(isEnum(ret) ? "Uint32" : mapFFIType(ret))} Function($cParams),")
        ..writeln("${(isEnum(ret) ? "int" : mapIntegralType(ret))} Function($dartParams)>('$methodName');")
        ..unindent()
        ..writeln("");
    }
  }
  writer
    ..writeln("//endregion")
    ..writeln();
  print("");
}

void generateTypes(DartWriter writer) {
  print("Generating Types...");
  writer.writeln("//region Types");
  for (var typeDef in defs.types) {
    if (customDefinedTypes.contains(typeDef.name)) {
      print("Skipping custom defined type: ${typeDef.name}");
      continue;
    }
    print("Generating type: ${typeDef.name}");

    writer.pushBlock("class ${typeDef.name} extends Struct");

    for (var field in typeDef.fields) {
      String typeString = getTypeString(field.type, field.isFunctionPointer);

      if (field.arraySize != 0) {
        if (legalFixedTypes.contains(typeString)) {
          writer
            ..writeln("@Array(${field.arraySize})")
            ..writeln("external Array<$typeString> ${field.name};");
        } else {
          for (int i = 0; i < field.arraySize; i++) {
            writer.writeln("external ${mapIntegralType(typeString)} ${camelCase(field.name)}_$i;");
          }
        }
      } else {
        if (legalFixedTypes.contains(typeString) || typeString == "IntPtr") writer.writeln("@${mapFFIType(typeString)}()");

        if (isEnum(typeString)) {
          writer
            ..writeln("/// Enum $typeString")
            ..writeln("@Uint32()")
            ..writeln("external int ${camelCase(field.name)};");
        } else {
          writer.writeln("external ${mapIntegralType(typeString)} ${camelCase(field.name)};");
        }
      }
      if (field != typeDef.fields.last) writer.writeln();
    }
    writer.popBlock();
  }
  writer
    ..writeln("//endregion")
    ..writeln();
  print("");
}

void generateEnums(DartWriter writer) {
  print("Generating Enums...");
  writer.writeln("//region Enums");
  for (var def in defs.enums) {
    print("Generating enum: ${def.friendlyNames[0]}");
    writer.pushBlock("class ${def.friendlyNames[0]}");
    for (var member in def.members) {
      writer.writeln("const int ${def.sanitizeNames(member.name)} = ${def.sanitizeNames(member.value)};");
    }
    writer.popBlock();
  }
  writer
    ..writeln("//endregion")
    ..writeln();
  print("");
}

bool isEnum(String typeString) {
  return defs.enums.map((x) => x.friendlyNames).any((x) => x.contains(typeString));
}

String getTypeString(String typeName, bool isFunctionPointer) {
  int pointerLevel = "*".allMatches(typeName).length;

  String typeString;

  if (!wellKnownTypes.containsKey(typeName)) {
    if (wellKnownTypes.containsKey(typeName.substring(0, typeName.length - pointerLevel))) {
      typeString = wellKnownTypes[typeName.substring(0, typeName.length - pointerLevel)]! + "*" * pointerLevel;
    } else {
      typeString = typeName;
      if (isFunctionPointer) typeString = "Pointer";
    }
  } else {
    typeString = wellKnownTypes[typeName]!;
  }

  return typeString;
}

String mapIntegralType(String type) {
  String mappedType = type;

  if (type.endsWith("*")) {
    var pointerLevel = "*".allMatches(type).length;
    mappedType = "Pointer<" * pointerLevel + mapFFIType(type.replaceAll("*", "")) + ">" * pointerLevel;
  } else if (type.toLowerCase().contains("callback")) {
    mappedType = "Pointer";
  } else {
    mappedType = switch (type) {
      "byte" || "sbyte" || "char" || "ushort" || "short" || "uint" || "int" || "ulong" || "long" || "IntPtr" => "int",
      "float" || "double" => "double",
      _ => mappedType,
    };
  }
  return mappedType;
}

String mapFFIType(String type) {
  String mappedType = type;

  if (type.endsWith("*")) {
    var pointerLevel = "*".allMatches(type).length;
    mappedType = "Pointer<" * pointerLevel + mapFFIType(type.replaceAll("*", "")) + ">" * pointerLevel;
  } else if (type.toLowerCase().contains("callback")) {
    mappedType = "Pointer";
  } else {
    mappedType = switch (type) {
      "byte" => "Uint8",
      "sbyte" => "Int8",
      "char" => "Uint8",
      "ushort" => "Uint16",
      "short" => "Int16",
      "uint" => "Uint32",
      "int" => "Int32",
      "ulong" => "Uint64",
      "long" => "Int64",
      "float" => "Float",
      "double" => "Double",
      "void" => "Void",
      _ => mappedType,
    };
  }
  return mappedType;
}

class SupportedLibrary {
  String name;
  bool referencesImGui;
  String classPrefix;
  late String dllName;

  SupportedLibrary({
    required this.name,
    required this.classPrefix,
    required this.dllName,
    this.referencesImGui = true,
  });
}

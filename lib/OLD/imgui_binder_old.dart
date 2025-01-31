import 'dart:io';

import 'package:collection/collection.dart';
import 'package:dart_style/dart_style.dart' show DartFormatter;
import 'package:imgui_binder/OLD/TypeInfo.dart';
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

  String outputDir = "lib/generated";
  if (args.length > 1) outputDir = args[1];

  if (!Directory(outputDir).existsSync()) Directory(outputDir).createSync();

  String defsPath = "resources/definitions/${lib.dllName}";
  defs.loadFrom(defsPath);

  print("Definitions loaded Successfully!");
  print("Generating bindings...");

  var writer = DartWriter();

  writer
    ..import("dart:io")..import("dart:ffi")
  // ..writeln()
  // ..import("package:vector_math/vector_math.dart")
    ..writeln();

  generateInitializer(writer);

  Map<String, List<OverloadDefinition>> structFunctions = {};

  print("Generating Functions...");
  writer.beginRegion("Functions");
  for (var func in defs.functions) {
    if (skippedFunctions.contains(func.name)) {
      print("Skipping function: ${func.name}");
      continue;
    }
    print("Generating function: ${func.name}");

    for (var overload in func.overloads) {
      if (overload.structName.isNotEmpty) continue;

      String exportedName = overload.exportedName;
      if (exportedName.contains("~")) continue;
      if (overload.parameters.any((tr) => tr.type.contains('('))) continue; // imgui.net skips these so we will too:tm:

      if ((overload.friendlyName == "GetID" || overload.friendlyName == "PushID") && overload.parameters.length > 1) continue;

      bool hasVarArg = false;
      for (var (i, tr) in overload.parameters.indexed) {
        String paramType = getTypeString(tr.type, tr.isFunctionPointer);
        if (tr.name == "...") continue;

        if (paramType == "va_list") {
          hasVarArg = true;
          break;
        }
      }
      if (hasVarArg) continue;

      var orderedDefaults = overload.defaultValues.entries.toList().sortedBy<num>((kvp) => getIndex(overload.parameters, kvp.key));

      emitOverload(
        writer,
        overload,
        Map.fromEntries(orderedDefaults),
        "NativePtr",
        lib.classPrefix,
      );
    }
    if (func != defs.functions.last) writer.writeln();
  }
  writer
    ..endRegion()
    ..writeln();
  print("");

  generateTempVectorStuff(writer);

  print("Generating Types...");
  writer.beginRegion("Types");
  for (var typeDef in defs.types) {
    if (customDefinedTypes.contains(typeDef.name)) {
      print("Skipping custom defined type: ${typeDef.name}");
      continue;
    }
    print("Generating type: ${typeDef.name}");

    writer.pushBlock("base class ${typeDef.name} extends Struct");

    for (var field in typeDef.fields) {
      String typeString = getTypeString(field.type, field.isFunctionPointer);

      if (field.arraySize != 0) {
        if (legalFixedTypes.contains(typeString)) {
          writer..writeln("@Array(${field.arraySize})")..writeln("external Array<${mapFFIType(typeString)}> ${camelCase(field.name)};");
        } else {
          for (int i = 0; i < field.arraySize; i++) {
            writer.writeln("external ${mapIntegralType(typeString)} ${camelCase(field.name)}_$i;");
          }
        }
      } else {
        if (legalFixedTypes.contains(typeString) || typeString == "IntPtr") writer.writeln("@${mapFFIType(typeString)}()");

        if (isEnum(typeString)) {
          writer..writeln("/// Enum $typeString")..writeln("@Uint32()")..writeln("external int ${camelCase(field.name)};");
        } else {
          writer.writeln("external ${mapIntegralType(typeString)} ${camelCase(field.name)};");
        }
      }
      writer.writeln();
    }

    for (var func in defs.functions) {
      print("Generating function: ${func.name}");

      for (var overload in func.overloads) {
        if (overload.structName != typeDef.name) continue;

        String exportedName = overload.exportedName;
        if (exportedName.contains("~")) continue;
        if (exportedName.contains("ImVector_")) continue;
        if (exportedName.contains("ImChunkStream_")) continue;

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

        if (guaranteedOverlaps.contains(friendly)) friendly = "$friendly${overload.structName}";

        writer..writeln("///```c")..writeln("/// $ret $friendly(");
        for (int j = 0; j < overload.parameters.length; j++) {
          var p = overload.parameters[j];
          writer.writeln("///   ${getTypeString(p.type, p.isFunctionPointer)} ${identifierReplacements[p.name] ?? p.name} ${(j == overload.parameters.length - 1 ? "" : ",")}");
        }
        writer
          ..writeln("/// );")..writeln("///```")..writeln("${(isEnum(ret) ? "int" : mapIntegralType(ret))} $friendly($dartParams) =>")
          ..indent()
          ..writeln("_$methodName($params);")
          ..unindent()
          ..writeln()..writeln("late final _$methodName = _${lib.dllName}.lookupFunction<")
          ..indent()
          ..writeln("${(isEnum(ret) ? "Uint32" : mapFFIType(ret))} Function($cParams),")..writeln("${(isEnum(ret) ? "int" : mapIntegralType(ret))} Function($dartParams)>('$methodName');")
          ..unindent()
          ..writeln("");
      }
    }
    writer.popBlock();
    if (typeDef != defs.types.last) writer.writeln();
  }
  writer
    ..endRegion()
    ..writeln();
  print("");

  generateEnums(writer);

  generateNativeWrappers(writer);

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
    ..beginRegion("Init")
    ..pushBlock("DynamicLibrary initialize${lib.classPrefix}(String path)")..pushBlock("var dll = switch (Platform.operatingSystem)")
    ..writeln('"windows" => "\$path.dll",')..writeln('"macos" => "\$path.dylib",')..writeln('"linux" => "\$path.so",')..writeln('_ => throw Exception("Unsupported platform \${Platform.operatingSystem}"),')
    ..popBlock(";")
    ..writeln()..writeln("return DynamicLibrary.open(dll);")
    ..popBlock()
    ..writeln()..writeln('final _${lib.dllName} = initialize${lib.classPrefix}("");')
    ..endRegion()
    ..writeln();
  print("");
}

void generateTempVectorStuff(DartWriter writer) {
  writer.beginRegion("TempVectorStuff");

  writer
    ..pushBlock("base class ImVector extends Struct")
    ..writeln("@Uint32()")..writeln("external int size;")..writeln()..writeln("@Uint32()")..writeln("external int capacity;")..writeln()..writeln("external Pointer data;")
    ..popBlock();

  writer
    ..pushBlock("base class Vector2 extends Struct")
    ..writeln("@Float()")..writeln("external double x;")..writeln()..writeln("@Float()")..writeln("external double y;")
    ..popBlock();

  writer
    ..pushBlock("base class Vector3 extends Struct")
    ..writeln("@Float()")..writeln("external double x;")..writeln()..writeln("@Float()")..writeln("external double y;")..writeln()..writeln("@Float()")..writeln("external double z;")
    ..popBlock();

  writer
    ..pushBlock("base class Vector4 extends Struct")
    ..writeln("@Float()")..writeln("external double x;")..writeln()..writeln("@Float()")..writeln("external double y;")..writeln()..writeln("@Float()")..writeln("external double z;")..writeln()..writeln("@Float()")..writeln("external double w;")
    ..popBlock();

  writer
    ..pushBlock("class ImGuiStoragePair extends Struct")
    ..writeln("@Uint32()")..writeln("external int key;")..writeln()..writeln("/// `value` can be casted to `int`, `float` or `intptr`")..writeln("@Uint32()")..writeln("external Pointer value;")
    ..popBlock();

  writer.endRegion();
  writer.writeln();
}

void generateEnums(DartWriter writer) {
  print("Generating Enums...");
  writer.beginRegion("Enums");
  for (var def in defs.enums) {
    print("Generating enum: ${def.friendlyNames[0]}");
    writer.pushBlock("class ${def.friendlyNames[0]}");
    for (var member in def.members) {
      writer.writeln("static const int ${def.sanitizeNames(member.name)} = ${def.sanitizeNames(member.value)};");
    }
    writer.popBlock();
  }
  writer
    ..endRegion()
    ..writeln();
  print("");
}

void generateNativeWrappers(DartWriter writer) {
  print("Generating Native Wrappers...");
  writer.beginRegion("Native Wrappers");

  for (var fd in defs.functions) {
    for (var overload in fd.overloads) {
      String exportedName = overload.exportedName;
      if (exportedName.contains("~")) continue;
      if (exportedName.contains("ImVector_")) continue;
      if (exportedName.contains("ImChunkStream_")) continue;

      if (overload.parameters.any((tr) => tr.type.contains('('))) continue; // imgui.net skips these so we will too:tm:

      String ret = getTypeString(overload.returnType);

      bool hasVarArg = false;
      List<String> paramParts = [];
      for (var (i, p) in overload.parameters.indexed) {
        String paramType = getTypeString(p.type, p.isFunctionPointer);
        if (p.arraySize != 0) paramType += "*";

        if (p.name == "...") continue;

        paramParts.add("$paramType ${identifierReplacements[p.name] ?? p.name}");

        if (paramType == "va_list") {
          hasVarArg = true;
          break;
        }
      }

      if (hasVarArg) continue;

      String parameters = paramParts.join(", ");

      bool isUdtVariant = exportedName.contains("nonUDT");
      String methodName = isUdtVariant ? exportedName.substring(0, exportedName.indexOf("_nonUDT")) : exportedName;

      if (isUdtVariant) {


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

  writer.endRegion();
}

bool isEnum(String typeString) {
  return defs.enums.map((x) => x.friendlyNames).any((x) => x.contains(typeString));
}

int getIndex(List<TypeReference> params, String key) {
  for (var (i, p) in params.indexed) {
    if (p.name == key) return i;
  }
  return -1;
}

void emitOverload(DartWriter writer,
    OverloadDefinition overload,
    Map<String, String> defaultValues,
    String? selfName,
    String classPrefix,) {
  var rangeParams = overload.parameters.where((tr) => tr.name.endsWith("_begin") || tr.name.endsWith("_end")).toList();
  if (rangeParams.any((tr) => tr.type != "char*")) return;
  if (rangeParams.any((tf) => tf.name.endsWith("_end") && defaultValues.containsKey(tf.name))) return;

  assert(!overload.isMemberFunction || selfName != null);

  String nativeReturnType = getTypeString(overload.returnType, false);
  bool isWrappedType = getWrappedType(nativeReturnType) != null;
  String safeReturnType = wellKnownTypes.containsKey(nativeReturnType) ? wellKnownTypes[nativeReturnType]! : getSafeType(nativeReturnType);

  List<({String mashalledType, String correctedIdentifier})> invocationArgs = [];
  List<MarshalledParameter?> marshalledParams = List.filled(overload.parameters.length, null);
  var preCall = DartWriter();
  var postCall = DartWriter();
  List<String> byRefParams = [];
  int selfIndex = -1;
  int pOutIndex = -1;
  String? overrideReturnType;
  for (var (i, tr) in overload.parameters.indexed) {
    if (tr.name == "self") {
      selfIndex = i;
      continue;
    }
    if (tr.name == "...") continue;

    var correctedIdentifier = identifierReplacements[tr.name] ?? tr.name;
    var nativeTypeName = getTypeString(tr.type, tr.isFunctionPointer);
    if (correctedIdentifier == "pOut" && overload.returnType == "void") {
      pOutIndex = i;
      overrideReturnType = nativeTypeName.replaceAll("*", "");
      preCall.writeln("$overrideReturnType __returnValue;");
      continue;
    }
    if (tr.type == "char*") {
      String textToEncode = correctedIdentifier;
      String? defaultValue = defaultValues[tr.name] != null ? correctDefaultValue(defaultValues[tr.name]!, tr) : null;
      if (defaultValue != null) textToEncode = defaultValue;

      String nativeArgName = "_${tr.name}";
      marshalledParams[i] = MarshalledParameter(
        "String",
        false,
        nativeArgName,
        defaultValue != null,
      );

      if (textToEncode == "null") {
        preCall.writeln("Pointer<Char> $nativeArgName = nullptr;");
      } else {
        if (tr.name.endsWith("_end")) {
          var startParamName = overload.parameters[i - 1].name;
          var startNativeName = "_$startParamName";
          marshalledParams[i] = MarshalledParameter(
            nativeTypeName,
            false,
            "$startNativeName+${startParamName}_byteCount",
            false,
          );
          continue;
        }

        var checkForNull = defaultValue != null && !tr.name.endsWith("_begin");

        preCall.writeln("Pointer<Char> $nativeArgName = $textToEncode.toNativeUtf8().cast()");
//TODO: look into this i got no idea if its correct (check Program:449-479 in imgui.net)
        postCall.writeln("$nativeArgName.free();");
      }
    } else if (defaultValues.containsKey(tr.name)) {
      var defaultValue = defaultValues[tr.name]!;
      var corrected = correctDefaultValue(defaultValue, tr) ?? defaultValue;
      marshalledParams[i] = MarshalledParameter(
        nativeTypeName,
        false,
        "_${tr.name}",
        true,
      );
      preCall.writeln("$nativeTypeName _${tr.name} = $corrected;");
    } else {
      marshalledParams[i] = MarshalledParameter(
        nativeTypeName,
        false,
        correctedIdentifier,
        false,
      );
    }

    if (!marshalledParams[i]!.hasDefaultValue) invocationArgs.add((mashalledType: nativeTypeName, correctedIdentifier: correctedIdentifier));
  }

  String invocationList = invocationArgs.map((x) => "${x.mashalledType} ${x.correctedIdentifier}").join(", ");
  String friendlyName = overload.friendlyName;

  String staticPortion = selfName == null ? "static " : "";

  writeMethod(
    writer,
    overload,
    selfName,
    classPrefix,
    staticPortion,
    overrideReturnType,
    safeReturnType,
    friendlyName,
    invocationList,
    preCall,
    marshalledParams,
    selfIndex,
    pOutIndex,
    nativeReturnType,
    postCall,
    isWrappedType,
  );
}

void writeMethod(DartWriter writer,
    OverloadDefinition overload,
    String? selfName,
    String classPrefix,
    String staticPortion,
    String? overrideRet,
    String safeRet,
    String friendlyName,
    String invocationList,
    DartWriter preCall,
    List<MarshalledParameter?> marshalledParams,
    int selfIndex,
    int pOutIndex,
    String nativeReturnType,
    DartWriter postCall,
    bool isWrapped,) {
  writer
    ..pushBlock("$staticPortion${overrideRet ?? safeRet} $friendlyName($invocationList)")
    ..writeWriter(preCall);

  List<String> nativeInvocationArgs = [];

  for (var (i, mp) in marshalledParams.indexed) {
    TypeReference tr = overload.parameters[i];
    if (selfIndex == i) {
      String typeString = getTypeString(tr.type);
      nativeInvocationArgs.add("($typeString)($selfName)");
      continue;
    }
    if (pOutIndex == i) {
      nativeInvocationArgs.add("(__returnValue)");
      continue;
    }
    if (mp == null) continue;
    //TODO: worry about fixed block stuff idk
    // if(mp.isPinned) {
    //   String nativePinType = getTypeString(tr.type);
    //   writer.pushBlock()
    // }
    nativeInvocationArgs.add(mp.varName);
  }

  String nativeInvocationString = nativeInvocationArgs.join(", ");

  String ret = safeRet == "void" ? "" : "$nativeReturnType ret = ";

  String targetName = overload.exportedName;
  if (targetName.contains("nonUDT")) targetName = targetName.substring(0, targetName.indexOf("_nonUDT"));

  writer.writeln("${ret}_$targetName($nativeInvocationString);");

  writer.writeWriter(postCall);

  if (safeRet != "void") {
    if (safeRet == "bool") {
      writer.writeln("return ret != 0;");
    } else if (overload.returnType == "char*" || overload.returnType == "ImWchar*") {
      writer.writeln("return ret.toDartString();");
    } else if (overload.returnType == "void*") {
      writer.writeln("return ret;");
    } else {
      writer.writeln("return ${isWrapped ? "new $safeRet(ret)" : "ret"}");
    }
  }

  if (overrideRet != null) writer.writeln("return __returnValue;");

  // for (var (i, mp) in marshalledParams.indexed) {
  //   if (mp == null) continue;
  //   if (mp.isPinned) {
  //     writer.writeln("${mp.pinTarget}.free();");
  //   }
  // }

  writer.popBlock();
}

String getSafeType(String nativeRet) {
  if (nativeRet == "bool") {
    return "bool";
  } else if (nativeRet == "char*") {
    return "string";
  } else if (nativeRet == "ImWchar*" || nativeRet == "void*") {
    return "IntPtr";
  }

  return getTypeString(nativeRet);
}

String getTypeString(String typeName, [bool isFunctionPointer = false]) {
  int pointerLevel = "*"
      .allMatches(typeName)
      .length;

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
    var pointerLevel = "*"
        .allMatches(type)
        .length;
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
    var pointerLevel = "*"
        .allMatches(type)
        .length;
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

String? getWrappedType(String nativeType) {
  if (nativeType.startsWith("Im") && nativeType.endsWith("*") && !nativeType.startsWith("ImVector")) {
    int pointerLevel = nativeType.length - nativeType.indexOf("*");
    if (pointerLevel > 1) return null;

    String nonPointerType = nativeType.substring(0, nativeType.length - pointerLevel);

    if (wellKnownTypes.containsKey(nonPointerType)) return wellKnownTypes[nonPointerType];

    return "${nonPointerType}Ptr";
  } else {
    return null;
  }
}

String? correctDefaultValue(String defaultVal, TypeReference tr) {
  if (tr.type == "ImGuiContext*" || tr.type == "ImPlotContext*" || tr.type == "EditorContext*") return "nullptr";

  if (wellKnownDefaultValues.containsKey(defaultVal)) return wellKnownDefaultValues[defaultVal]!;

  if (tr.type == "bool") return bool.parse(defaultVal) ? "1" : "0";

  if (defaultVal.contains("%")) return null;

  if (tr.isEnum) {
    if (defaultVal.startsWith("-")) {
      return "(${tr.type})($defaultVal)";
    } else {
      return "(${tr.type})$defaultVal";
    }
  }

  return defaultVal;
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

//TODO: figure out what can be removed from this
class MarshalledParameter {
  String marshalledType;
  bool isPinned;
  String varName;
  bool hasDefaultValue;
  String? pinTarget;

  MarshalledParameter(this.marshalledType,
      this.isPinned,
      this.varName,
      this.hasDefaultValue,);
}

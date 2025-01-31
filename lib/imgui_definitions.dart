import 'dart:convert';
import 'dart:io';

import 'package:imgui_binder/util.dart';

import 'OLD/TypeInfo.dart';

class ImGuiDefinitions {
  late List<EnumDefinition> enums;
  late List<TypeDefinition> types;
  late List<FunctionDefinition> functions;
  late Map<String, MethodVariant> variants;

  static int getInt(dynamic token, String key) {
    var v = token[key];
    if (v == null) return 0;
    return v as int;
  }

  loadFrom(String directory) {
    var typesJson = json.decode(File("$directory/structs_and_enums.json").readAsStringSync());

    var functionsJson = json.decode(File('$directory/definitions.json').readAsStringSync());

    dynamic variantsJson;

    if (File('$directory/variants.json').existsSync()) {
      variantsJson = json.decode(File('$directory/variants.json').readAsStringSync());
    }

    variants = <String, MethodVariant>{};
    variantsJson.forEach((key, value) {
      List<ParameterVariant> parameters = <ParameterVariant>[];
      for (var parameter in value) {
        parameters.add(ParameterVariant(
          parameter['name'],
          parameter['type'],
          List<String>.from(parameter['variants']),
        ));
      }
      variants[key] = MethodVariant(key, parameters);
    });

    var typeLocations = typesJson["locations"];

    enums = (typesJson["enums"] as Map<String, dynamic>).entries.where((entry) => !(typeLocations[entry.key] as String).contains("internal")).map((entry) {
      var elements = <EnumMember>[];
      for (var v in entry.value) {
        elements.add(EnumMember(v["name"], v["calc_value"].toString()));
      }
      return EnumDefinition(entry.key, elements);
    }).toList();

    types = (typesJson["structs"] as Map<String, dynamic>).entries.where((entry) => !(typeLocations[entry.key] as String).contains("internal")).map((entry) {
      var fields = <TypeReference>[];
      entry.value.forEach((f) {
        fields.add(TypeReference(
          f["name"],
          f["type"],
          getInt(f, "size"),
          enums,
          templateType: f["template_type"] ?? "",
        ));
      });
      return TypeDefinition(entry.key, fields);
    }).toList();

    functions = <FunctionDefinition>[];
    functionsJson.forEach((key, val) {
      bool hasNonUdtVariant = val.any((v) => (v["ov_cimguiname"] as String?)?.endsWith("nonUDT") ?? false);
      var overloads = <OverloadDefinition>[];
      val.forEach((o) {
        var ovImGuiName = o["ov_cimguiname"];
        var imguiName = o["cimguiname"];
        var friendlyName = o["funcname"]?.toString().toCamelCase();
        if (imguiName.endsWith("_destroy")) friendlyName = "destroy";

        var typeName = o["stname"];
        if (typeName.isNotEmpty && !types.any((element) => element.name == typeName)) return null;
        if (friendlyName == null) return null;
        if (o["location"]?.contains("internal") ?? false) return null;

        var exportedName = ovImGuiName ?? imguiName;

        if (hasNonUdtVariant && !exportedName.endsWith("nonUDT2")) return null;

        String selfTypeName;
        int underscoreIndex = exportedName.indexOf("_");
        if (underscoreIndex > 0 && !exportedName.startsWith("ig")) selfTypeName = exportedName.substring(0, underscoreIndex);

        var parameters = <TypeReference>[];

        var methodVariants = variants[key];

        for (var p in o["argsT"]) {
          var pType = p["type"];
          var pName = p["name"];

          ParameterVariant? matchingVariant = methodVariants?.parameters.cast().firstWhere((element) => element.name == pName && element.originalType == pType, orElse: () => null);
          if (matchingVariant != null) matchingVariant.used = true;

          parameters.add(TypeReference(p["name"], p["type"], 0, enums, typeVariants: matchingVariant?.variantTypes ?? []));
        }

        var defaultValues = <String, String>{};
        o["defaults"].forEach((key, value) {
          defaultValues[key] = value;
        });
        var returnType = o["ret"] ?? "void";
        String comment = "";

        var structName = o["stname"];
        bool isConstructor = o["constructor"] ?? false;
        bool isDestructor = o["destructor"] ?? false;
        if (isConstructor) returnType = structName + "*";

        overloads.add(OverloadDefinition(
          exportedName,
          friendlyName,
          parameters,
          defaultValues,
          returnType,
          structName,
          comment,
          isConstructor,
          isDestructor,
        ));
      });
      if (overloads.isEmpty) return null;
      functions.add(FunctionDefinition(key, overloads, enums));
    });
  }
}

class MethodVariant {
  String name;
  List<ParameterVariant> parameters;

  MethodVariant(this.name, this.parameters);
}

class ParameterVariant {
  String name;
  String originalType;
  List<String> variantTypes;
  bool used = false;

  ParameterVariant(
    this.name,
    this.originalType,
    this.variantTypes,
  );
}

class EnumDefinition {
  late final Map<String, String> _sanitizedNames = {};

  late List<String> names;
  late List<String> friendlyNames;
  late List<EnumMember> members;

  EnumDefinition(String name, List<EnumMember> elements) {
    names = [name];
    if (alternativeEnumPrefixes.containsKey(name)) names.add(alternativeEnumPrefixes[name]!);

    friendlyNames = names.map((e) => e.endsWith("_") ? e.substring(0, e.length - 1) : e).toList();

    members = elements;

    for (var element in elements) {
      _sanitizedNames[element.name] = _sanitizeMemberName(element.name);
    }
  }

  String sanitizeNames(String text) {
    _sanitizedNames.forEach((key, value) {
      text = text.replaceAll(key, value);
    });
    return text;
  }

  String _sanitizeMemberName(String memberName) {
    String ret = memberName;
    bool altSubstitution = false;

    for (var i = 0; i < alternateEnumPrefixSubstitutions.length; i++) {
      var key = alternateEnumPrefixSubstitutions.keys.elementAt(i);
      var value = alternateEnumPrefixSubstitutions.values.elementAt(i);
      if (ret.startsWith(key)) {
        ret = ret.replaceAll(key, value);
        altSubstitution = true;
        break;
      }
    }

    if (!altSubstitution) {
      for (var name in names) {
        if (memberName.startsWith(name)) {
          ret = memberName.substring(name.length);
          if (ret.startsWith("_")) ret = ret.substring(1);
        }
      }
    }

    if (ret.endsWith("_")) ret = ret.substring(0, ret.length - 1);

    if (isDigit(ret, 0)) ret = "_$ret";

    return ret;
  }
}

class EnumMember {
  String name;
  String value;

  EnumMember(this.name, this.value);
}

class TypeDefinition {
  String name;
  List<TypeReference> fields;

  TypeDefinition(this.name, this.fields);
}

class TypeReference {
  String name;
  late String type;
  late String templateType;
  int arraySize;
  late bool isFunctionPointer;
  late List<String> typeVariants;
  late bool isEnum;

  TypeReference(
    this.name,
    String type,
    this.arraySize,
    List<EnumDefinition> enums, {
    this.templateType = "",
    this.typeVariants = const [],
  }) {
    this.type = type.replaceAll("const", "").trim();

    if (type.startsWith("ImVector_")) {
      this.type = "ImVector${type.endsWith("*") ? "*" : ""}";
    }
    if (type.startsWith("ImChunkStream_")) {
      this.type = "ImChunkStream${type.endsWith("*") ? "*" : ""}";
    }

    int startBracket = name.indexOf("[");
    if (startBracket != -1) {
      int endBracket = name.indexOf("]");
      String sizePart = name.substring(startBracket + 1, endBracket - 1);
      if (arraySize == 0) arraySize = _parseSizeString(sizePart, enums);
      name = name.substring(0, startBracket);
    }
    isFunctionPointer = type.contains("(");
    isEnum = enums.any((element) => element.names.contains(type) || element.friendlyNames.contains(type) || wellKnownEnums.contains(type));
  }

  static int _parseSizeString(String sizePart, List<EnumDefinition> enums) {
    int plusStart = sizePart.indexOf("+");
    if (plusStart != -1) {
      String first = sizePart.substring(0, plusStart);
      String second = sizePart.substring(plusStart, sizePart.length - plusStart);
      int firstVal = int.parse(first);
      int secondVal = int.parse(second);
      return firstVal + secondVal;
    }

    var ret = int.tryParse(sizePart);
    if (ret == null) {
      for (var enumDef in enums) {
        if (enumDef.names.any((name) => sizePart.startsWith(name))) {
          var member = enumDef.members.firstWhere((element) => element.name == sizePart);
          return int.parse(member.value);
        }
      }

      ret = -1;
    }

    return ret;
  }

  TypeReference withVariant(int variantIndex, List<EnumDefinition> enums) {
    if (variantIndex == 0) return this;
    return TypeReference(
      name,
      typeVariants[variantIndex - 1],
      arraySize,
      enums,
      templateType: templateType,
      typeVariants: typeVariants,
    );
  }
}

class FunctionDefinition {
  String name;
  List<OverloadDefinition> overloads;

  FunctionDefinition(
    this.name,
    List<OverloadDefinition> overloads,
    List<EnumDefinition> enums,
  ) : overloads = expandOverloadVariants(overloads, enums);

  static List<OverloadDefinition> expandOverloadVariants(List<OverloadDefinition> overloads, List<EnumDefinition> enums) {
    List<OverloadDefinition> newDefs = <OverloadDefinition>[];

    for (var overload in overloads) {
      bool hasVariants = false;
      List<int> variantCounts = <int>[];

      for (var parameter in overload.parameters) {
        if (parameter.typeVariants.isEmpty) {
          hasVariants = true;
          variantCounts.add(parameter.typeVariants.length + 1);
        } else {
          variantCounts.add(1);
        }
      }

      if (hasVariants) {
        int totalVariants = variantCounts[0];
        for (var count in variantCounts) {
          totalVariants *= count;
        }

        for (int i = 0; i < totalVariants; i++) {
          List<TypeReference> params = <TypeReference>[];
          int div = 1;

          for (int j = 0; j < overload.parameters.length; j++) {
            int k = (i ~/ div) % variantCounts[j];
            params.add(overload.parameters[j].withVariant(k, enums));
            if (j > 0) div *= variantCounts[j];
          }

          newDefs.add(OverloadDefinition(
            overload.exportedName,
            overload.friendlyName,
            params,
            overload.defaultValues,
            overload.returnType,
            overload.structName,
            overload.comment,
            overload.isConstructor,
            overload.isDestructor,
          ));
        }
      } else {
        newDefs.add(overload);
      }
    }
    return newDefs;
  }
}

class OverloadDefinition {
  String exportedName;
  String friendlyName;
  List<TypeReference> parameters;
  Map<String, String> defaultValues;
  String returnType;
  String structName;
  bool isMemberFunction;
  String comment;
  bool isConstructor;
  bool isDestructor;

  OverloadDefinition(
    this.exportedName,
    this.friendlyName,
    this.parameters,
    this.defaultValues,
    String returnType,
    this.structName,
    this.comment,
    this.isConstructor,
    this.isDestructor,
  )   : returnType = returnType.replaceAll("const", "").replaceAll("inline", "").trim(),
        isMemberFunction = structName.isNotEmpty;

  OverloadDefinition withParameters(List<TypeReference> newParams) {
    return OverloadDefinition(
      exportedName,
      friendlyName,
      newParams,
      defaultValues,
      returnType,
      structName,
      comment,
      isConstructor,
      isDestructor,
    );
  }
}

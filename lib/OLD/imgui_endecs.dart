import 'package:endec/endec.dart';

class FunctionMetaData {
  final List<FunctionArg> args;
  final String argsString;
  final String? argsOriginal;
  final String callArgs;
  final String imguiName;
  final Map<String, String> defaults;
  final bool constructor;
  final bool destructor;
  final String? funcName;
  final String location;
  final String? namespace;
  final String ovImguiName;
  final String? ret;
  final String signature;
  final String stName;

  static final endec = structEndec<FunctionMetaData>().with15Fields(
    FunctionArg.endec.listOf().fieldOf('argsT', (struct) => struct.args),
    Endec.string.fieldOf('args', (struct) => struct.argsString),
    Endec.string.optionalOf().fieldOf('argsoriginal', (struct) => struct.argsOriginal, defaultValueFactory: () => null),
    Endec.string.fieldOf('call_args', (struct) => struct.callArgs),
    Endec.string.fieldOf('cimguiname', (struct) => struct.imguiName),
    Endec.string.mapOf().fieldOf('defaults', (struct) => struct.defaults),
    Endec.bool.fieldOf("constructor", (struct) => struct.constructor, defaultValueFactory: () => false),
    Endec.bool.fieldOf("destructor", (struct) => struct.destructor, defaultValueFactory: () => false),
    Endec.string.optionalOf().fieldOf('funcname', (struct) => struct.funcName, defaultValueFactory: () => null),
    Endec.string.fieldOf('location', (struct) => struct.location),
    Endec.string.optionalOf().fieldOf('namespace', (struct) => struct.namespace, defaultValueFactory: () => null),
    Endec.string.fieldOf('ov_cimguiname', (struct) => struct.ovImguiName),
    Endec.string.optionalOf().fieldOf('ret', (struct) => struct.ret, defaultValueFactory: () => null),
    Endec.string.fieldOf('signature', (struct) => struct.signature),
    Endec.string.fieldOf('stname', (struct) => struct.stName),
    (
      args,
      argsString,
      argsOriginal,
      callArgs,
      imguiName,
      defaults,
      constructor,
      destructor,
      funcName,
      location,
      namespace,
      ovImguiName,
      ret,
      signature,
      stName,
    ) =>
        FunctionMetaData(
      args,
      argsString,
      argsOriginal,
      callArgs,
      imguiName,
      defaults,
      constructor,
      destructor,
      funcName,
      location,
      namespace,
      ovImguiName,
      ret,
      signature,
      stName,
    ),
  );

  FunctionMetaData(
    this.args,
    this.argsString,
    this.argsOriginal,
    this.callArgs,
    this.imguiName,
    this.defaults,
    this.constructor,
    this.destructor,
    this.funcName,
    this.location,
    this.namespace,
    this.ovImguiName,
    this.ret,
    this.signature,
    this.stName,
  );
}

class FunctionArg {
  final String name;
  final String type;

  static final endec = structEndec<FunctionArg>().with2Fields(
    Endec.string.fieldOf('name', (struct) => struct.name),
    Endec.string.fieldOf('type', (struct) => struct.type),
    (name, type) => FunctionArg(name, type),
  );

  FunctionArg(this.name, this.type);
}


var fixers = {
  'const char*': (type: 'String', out: ".toNativeUtf8().cast()", ffi: "ffi.Pointer<ffi.Char>"),
};

var ffi = {
  'bool': 'ffi.Bool',
  'const char*': 'ffi.Char',
};

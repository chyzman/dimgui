class DartWriter {
  final StringBuffer content = StringBuffer();
  int indentSize;
  int currentIndent = 0;

  DartWriter([this.indentSize = 2]);

  void indent([int amount = 1]) {
    currentIndent += amount;
  }

  void unindent([int amount = 1]) {
    currentIndent -= amount;
  }

  void write(Object? object) {
    content.write(' ' * (currentIndent * indentSize));
    content.write(object);
  }

  void writeln([Object? object = '']) {
    if (object != null && object.toString().isNotEmpty) write(object);
    content.writeln();
  }

  void writeAll(Iterable<Object> objects) {
    for (var object in objects) {
      write(object);
    }
  }

  void writelnAll(Iterable<Object> objects) {
    for (var object in objects) {
      writeln(object);
    }
  }

  void writeWriter(DartWriter writer) {
    writer.content.toString().split('\n').forEach((line) {
      writeln(line);
    });
  }

  void pushBlock(String header) {
    writeln("$header {");
    indent();
  }

  void popBlock([String? suffix]) {
    unindent();
    writeln("}${suffix ?? ''}");
  }

  void beginRegion(String name) {
    writeln("// region $name");
  }

  void endRegion() {
    writeln("// endregion");
  }

  void import(String path, [String suffix = ""]) {
    writeln("import '$path'${suffix.isNotEmpty ? " $suffix" : ""};");
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: SimplePrinter(printTime: true),
  filter: ProductionFilter(),
  output: _AppFileOutput(),
);

class _AppFileOutput extends LogOutput {
  _AppFileOutput();

  @override
  void output(OutputEvent event) async {
    late File file = File(Directory.current.path + r'\app.log');

    for (var line in event.lines) {
      await file.writeAsString("${line.toString()}\n",
          mode: FileMode.writeOnlyAppend);
      debugPrint(line); //print to console as well
    }
  }
}

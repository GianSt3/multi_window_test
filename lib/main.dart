import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multi_window_test/features/primary/index.dart';
import 'package:multi_window_test/features/secondary/index.dart';
import 'package:multi_window_test/utils/index.dart';

void main(List<String> args) {
  if (args.firstOrNull == 'multi_window') {
    logger.d("Multi window");

    final windowId = int.parse(args[1]);
    final argument = args[2].isEmpty
        ? const {}
        : jsonDecode(args[2]) as Map<String, dynamic>;
    runApp(SecondaryScreen(
      // windowController: WindowController.fromWindowId(windowId),
      args: argument,
    ));
  } else {
    runApp(const PrimaryScreen());
  }
}

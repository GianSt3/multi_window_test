import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Primary"),
        ),
        body: Column(
          children: [
            TextButton(
              onPressed: () async {
                final window =
                    await DesktopMultiWindow.createWindow(jsonEncode({
                  'args1': 'Sub window',
                  'args2': 100,
                  'args3': true,
                  'business': 'business_test',
                }));
                window
                  ..setFrame(const Offset(0, 0) & const Size(1280, 720))
                  ..center()
                  ..setTitle('Another window')
                  ..show();
              },
              child: Text("Open new window"),
            ),
            TextButton(
              onPressed: () async {
                final subWindowIds =
                    await DesktopMultiWindow.getAllSubWindowIds();
                for (final windowId in subWindowIds) {
                  DesktopMultiWindow.invokeMethod(
                    windowId,
                    'broadcast',
                    'Broadcast from main window',
                  );
                }
              },
              child: Text("Send event"),
            )
          ],
        ),
      ),
    );
  }
}

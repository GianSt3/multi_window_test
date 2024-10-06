import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multi_window_test/utils/index.dart';

class SecondaryMessagesPage extends StatefulWidget {
  const SecondaryMessagesPage({super.key});

  @override
  State<SecondaryMessagesPage> createState() => _SecondaryMessagesPageState();
}

class _SecondaryMessagesPageState extends State<SecondaryMessagesPage> {
  final messages = <String>[];

  @override
  void initState() {
    super.initState();
    DesktopMultiWindow.setMethodHandler(_handle);
  }

  @override
  void dispose() {
    DesktopMultiWindow.setMethodHandler(null);
    super.dispose();
  }

  Future<dynamic> _handle(MethodCall call, int fromWindowId) async {
    final ids = await DesktopMultiWindow.getAllSubWindowIds();
    logger.d('$ids` --- ${call.toString()}');
    setState(() {
      messages.add(call.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) => Text(messages.elementAt(index)));
  }
}

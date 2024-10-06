import 'package:flutter/material.dart';
import 'package:multi_window_test/features/secondary/presenter/widget/secondary_messages_page.dart';

class SecondaryScreen extends StatelessWidget {
  const SecondaryScreen({super.key, this.args});

  final Map? args;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Secondary"),
        ),
        body: Column(
          children: [
            Text(args != null ? args.toString() : "..."),
            Expanded(
              child: SecondaryMessagesPage(),
            )
          ],
        ),
      ),
    );
  }
}

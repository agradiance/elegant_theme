import 'package:elegant_theme/elegant_theme.dart';
import 'package:flutter/material.dart';

class ElegantDemoPage extends StatelessWidget {
  const ElegantDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TChange Theme Page"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ///Change to next theme
            ElegantTheme.controllerOf(context).nextTheme();
          },
          child: const Text("Next Theme"),
        ),
      ),
    );
  }
}

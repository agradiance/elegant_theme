import 'package:elegant_theme/elegant_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ///Create ElegantTheme
    return ElegantTheme(
      themes: [
        ThemeData.light(useMaterial3: true).copyWith(),
        ThemeData.dark(useMaterial3: true).copyWith(),
      ],
      builder: (context) {
        return MaterialApp(
          title: 'Elegant Theme Example',
          debugShowCheckedModeBanner: false,

          ///Make [ElegantTheme] your app elegant Theme
          ///Remember to use the builder context
          theme: ElegantTheme.themeOf(context),
          home: const MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Some Awesome data"),
      ),
    );
  }
}

///Example
///Change to next theme
class ElegantDemoPage extends StatelessWidget {
  const ElegantDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Theme Page"),
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

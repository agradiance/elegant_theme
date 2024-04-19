<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Elegant theme is an awesome way to Beautify your Flutter Application

## Features

>Easily manage your application theme
>Toggle between provided themes

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
import 'package:elegant_theme/elegant_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Create ElegantTheme
    return ElegantTheme(
      themes: [
        ThemeData.dark(useMaterial3: true).copyWith(),
        ThemeData.dark(useMaterial3: true).copyWith(),
      ],
      child: MaterialApp(
        title: 'Elegant Theme Example',
        debugShowCheckedModeBanner: false,
        theme: ElegantTheme.themeOf(context),
        home: const MyHomePage(),
      ),
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
        child: Text("Elegant data"),
      ),
    );
  }
}

```

## Additional information

This package is still in development; expect frequent update

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

Elegant theme is an Elegant Theme Package for Elegant Flutter Application

## Features

> Easily manage your application theme
> Toggle between provided themes

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

```dart
import 'package:elegant_theme/elegant_theme.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
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
        // Using ThemeData
        ElegantThemeData.fromThemeData(name: "ThemeData", description: "My Elegant ThemeData", light: ThemeData.light(), dark: ThemeData.light()),

        // Using ColorScheme
        ElegantThemeData.fromColorScheme(name: "Color Scheme", colorScheme: ColorScheme.fromSwatch()),

        //using Material3: useMaterial3 is true by default
        ElegantThemeData.fromFlexScheme(name: "FlexScheme1", flexScheme: FlexScheme.aquaBlue),
        ElegantThemeData.fromFlexScheme(name: "FlexScheme2", flexScheme: FlexScheme.aquaBlue, useMaterial3: true),
      ],
      builder: (context, theme, themeMode) {
        ///Make [ElegantTheme] your app elegant Theme
        return MaterialApp(
          title: 'Elegant Theme Example',
          debugShowCheckedModeBanner: false,
          theme: theme,
          themeMode: themeMode,
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
        child: ElegantDemoPage(),
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
        child: Wrap(
          children: [
            ElevatedButton(
              onPressed: () {
                ///Change to next theme
                ElegantTheme.nextTheme(context);
              },
              child: const Text("Next Theme"),
            ),
            ElevatedButton(
              onPressed: () {
                ///Change using context
                context.nextTheme();
              },
              child: const Text("Next Theme"),
            ),
            ElevatedButton(
              onPressed: () {
                ///Set dark theme Mode
                ElegantTheme.switchToDarkThemeMode(context);
              },
              child: const Text("Dark Theme"),
            ),
            ElevatedButton(
              onPressed: () {
                ///Change using context
                context.switchToDarkThemeMode();
              },
              child: const Text("Dark Theme"),
            ),
            ElevatedButton(
              onPressed: () {
                ///Set dark theme Mode
                ElegantTheme.switchToLightThemeMode(context);
              },
              child: const Text("Light Theme"),
            ),
            ElevatedButton(
              onPressed: () {
                ///Change using context
                context.switchToLightThemeMode();
              },
              child: const Text("Light Theme"),
            ),
            ElevatedButton(
              onPressed: () {
                ///Change to the first theme with name [FlexScheme1] as declare in the constructor
                ///ElegantThemeData.fromFlexScheme(name: "FlexScheme1", flexScheme: FlexScheme.aquaBlue),
                context.switchToThemeByName("FlexScheme1");
              },
              child: const Text("Swith to Theme By Name"),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Using with Buildcontext

```
	//you can now call 
	context.elegantTheme; //Returns the ElegantTheme, same as ElegantTheme.of(context)

	context.elegantThemeData; //Returns the ThemeData

	context.elegantThemeMode; //Returns the ThemeMode,

	context.nextTheme(); //Change to the next elegant theme on the list

	context.switchToThemeByName(String themeName)

	context.switchThemeMode()

	context.switchToSystemThemeMode()

	context.switchToDarkThemeMode()

	context.switchToLightThemeMode()

	elegantThemeNameAndDescriptionRecordList

	currentElegantThemeNameAndDescriptionRecord

```

## Additional information

This package is still in development; expect frequent update

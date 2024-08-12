## 0.0.8

### !!!BREAKING CHANGES!!!

```
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

### Added extension for Buildcontext.

```dart
	//you can now call 
	context.elegantTheme

	context.elegantThemeData

	context.elegantThemeMode

	context.nextTheme()

	context.switchToThemeByName(String themeName)

	context.switchThemeMode()

	context.switchToSystemThemeMode()

	context.switchToDarkThemeMode()

	context.switchToLightThemeMode()

	elegantThemeNameAndDescriptionRecordList

	currentElegantThemeNameAndDescriptionRecord
```


## 0.0.7

### !!!BREAKING CHANGES!!!

```
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

### Added extension for Buildcontext.

```dart
	//you can now call 
	context.elegantTheme

	context.elegantThemeData

	context.elegantThemeMode

	context.nextTheme()

	context.switchToThemeByName(String themeName)

	context.switchThemeMode()

	context.switchToSystemThemeMode()

	context.switchToDarkThemeMode()

	context.switchToLightThemeMode()

	elegantThemeNameAndDescriptionRecordList

	currentElegantThemeNameAndDescriptionRecord
```


## 0.0.6

### Added extension for Buildcontext.

```dart
    //you can now call 
    context.elegantThemeData // returns ThemeData
    context.elegantThemeController // returns ElegantThemeController  
```

## 0.0.5

* Bug fixes

### Breaking Changes

- Changed `child` property in ElegantTheme to `builder` function. Update your code accordingly.
- Updated minimum required Flutter version to 3.0.0

```dart
		// Before
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ElegantTheme(
      themes: [
        FlexThemeData.light(colorScheme: AppColorScheme.flexSchemeLight),
        FlexThemeData.dark(colorScheme: AppColorScheme.flexSchemeDark),
      ],
      child: Builder(
        builder: (context){
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ElegantTheme.themeOf(context),
                home: const HomeView(),
            )
        }
      ),
    );
  }
}

// After
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ElegantTheme(
      themes: [
        FlexThemeData.light(colorScheme: AppColorScheme.flexSchemeLight),
        FlexThemeData.dark(colorScheme: AppColorScheme.flexSchemeDark),
      ],

      ///Change to builder
      builder: (BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ElegantTheme.themeOf(context),
          home: const HomeView(),
        );
      },
    );
  }
}
```

## 0.0.4

### Breaking Changes

- Updated minimum required Flutter version to 3.3.2.

* Bug fixes

## 0.0.3

* Added example

## 0.0.2

* Fixed some bugs

## 0.0.1

* This is the first release, expect a frequent update

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

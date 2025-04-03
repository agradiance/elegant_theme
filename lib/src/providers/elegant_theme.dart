// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';
import 'package:elegant_theme/src/extension/elegant_theme_extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/elegant_theme_data.dart';
part '../models/elegant_theme_model.dart';

typedef ElegantScheme = FlexScheme;

class ElegantTheme extends StatefulWidget with ElegantThemeMixin {
  static final String _savedThemeIndexKey = "_ElegantTheme__SavedThemeIndexKey";
  static final String _savedThemeModeKey = "_ElegantTheme__SavedThemeModeKey";

  static int? _savedThemeIndex;
  static ThemeMode? _savedThemeMode = ThemeMode.dark;

  const ElegantTheme({
    super.key,
    required this.builder,
    required this.themes,
    this.saveChanges = true,
    this.initialThemeIndex = 0,
    this.initialThemeMode,
  })  : assert(
            themes != null && themes.length > 0, "Themes list cannot be empty"),
        assert(
            themes != null &&
                0 <= initialThemeIndex &&
                initialThemeIndex < themes.length,
            "Initial theme index is out of range");

  static Future<SharedPreferences> get _prefs async =>
      await SharedPreferences.getInstance();
  // static late final ElegantTheme _internal;

  static ThemeMode? themeModeFromString({required String value}) {
    return switch (value.toLowerCase()) {
      "light" => ThemeMode.light,
      "dark" => ThemeMode.dark,
      "system" => ThemeMode.system,
      _ => null,
    };
  }

  static Future<bool> _saveThemeMode({required ThemeMode mode}) async {
    final value = switch (mode) {
      ThemeMode.light => "light",
      ThemeMode.dark => "dark",
      ThemeMode.system => "system",
    };
    return (await _prefs).setString(ElegantTheme._savedThemeModeKey, value);
  }

  static Future<bool> _saveThemeIndex(
      {required int? value, bool? clearIfNull}) async {
    final pref = await _prefs;
    if (value != null) {
      return pref.setInt(ElegantTheme._savedThemeIndexKey, value);
    } else if (clearIfNull == true) {
      return pref.remove(ElegantTheme._savedThemeIndexKey);
    }
    return false;
  }

  static Future<void> initialize() async {
    final SharedPreferences prefs = await ElegantTheme._prefs;

    final index = prefs.getInt(_savedThemeIndexKey);
    final sTHem = prefs.getString(_savedThemeModeKey).toString();
    final themeMode = themeModeFromString(value: sTHem) ?? ThemeMode.dark;

    _savedThemeIndex = index;
    _savedThemeMode = themeMode;
  }

  static void saveTheme(BuildContext context,
      {ThemeMode? themeMode, int? themeIndex, bool? switchTo}) {
    final theme = Provider.of<_ElegantThemeModel>(context, listen: false);

    final currentIndex = theme._currentThemeIndex;
    final currentThemeMode = theme.themeMode;

    if (themeIndex != null &&
        themeIndex != currentIndex &&
        0 <= themeIndex &&
        themeIndex < theme.data.length) {
      _saveThemeIndex(value: themeIndex);
    }
    if (themeMode != null && themeMode != currentThemeMode) {
      _saveThemeMode(mode: themeMode);
    }

    if (switchTo == true) {
      setThemeByIndex(context, index: themeIndex ?? currentIndex);
    }
    initialize();
  }

  final bool saveChanges;
  final int initialThemeIndex;
  final ThemeMode? initialThemeMode;
  final List<ElegantThemeData>? themes;

  final Widget Function(
      BuildContext context, ThemeData theme, ThemeMode themeMode) builder;

  static bool switchToThemeByName(BuildContext context, String themeName) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        .setThemeByName(themeName);
  }

  static ThemeData dataOf(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: true).theme;
  }

  static ThemeMode modeOf(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).themeMode;
  }

  static ElegantTheme of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<ElegantTheme>() ??
        (throw Exception('ElegantTheme not found in the widget tree.'));
  }

  static List<({String? description, String name})>
      getElegantThemeNameAndDescriptionRecordList(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        .elegantThemeNameAndDescriptionRecordList;
  }

  static ({String? description, String name})
      getCurrentElegantThemeNameAndDescriptionRecord(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        .currentElegantThemeNameAndDescriptionRecord;
  }

  static bool nextTheme(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)._nextTheme();
  }

  static bool setThemeByIndex(BuildContext context, {required int index}) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        ._setThemeByIndex(index: index);
  }

  static bool switchThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        ._switchThemeMode();
  }

  static bool switchToSystemThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        ._setSystemThemeMode();
  }

  static bool switchToLightThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        ._setLightThemeMode();
  }

  static bool switchToDarkThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)
        ._setDarkThemeMode();
  }

  @override
  State<ElegantTheme> createState() => _ElegantThemeState();
}

class _ElegantThemeState extends State<ElegantTheme> {
  late final _ElegantThemeModel _elegantThemeModel;

  @override
  void initState() {
    super.initState();
    _elegantThemeModel = _ElegantThemeModel(
      data: widget.themes,
      saveChanges: widget.saveChanges,
      themeMode: ElegantTheme._savedThemeMode ?? widget.initialThemeMode,
      currentThemeIndex:
          ElegantTheme._savedThemeIndex ?? widget.initialThemeIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _elegantThemeModel,
      child: Builder(
        builder: (context) {
          return widget.builder(
              context, context.elegantThemeData, context.elegantThemeMode);
        },
      ),
    );
  }
}

mixin ElegantThemeMixin {
  bool isDarkThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).themeMode ==
        ThemeMode.dark;
  }

  bool isLightThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).themeMode ==
        ThemeMode.light;
  }

  bool isSystemThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).themeMode ==
        ThemeMode.system;
  }
}

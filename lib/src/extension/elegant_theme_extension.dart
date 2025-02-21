import 'package:elegant_theme/elegant_theme.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  ElegantTheme get elegantTheme {
    return ElegantTheme.of(this);
  }

  ThemeData get elegantThemeData {
    return ElegantTheme.dataOf(this);
  }

  ThemeMode get elegantThemeMode {
    return ElegantTheme.modeOf(this);
  }

  bool get isDarkThemeMode {
    return elegantTheme.isDarkThemeMode(this);
  }

  bool get isLightThemeMode {
    return elegantTheme.isLightThemeMode(this);
  }

  bool get isSystemThemeMode {
    return elegantTheme.isSystemThemeMode(this);
  }

  bool nextTheme() {
    return ElegantTheme.nextTheme(this);
  }

  bool switchToThemeByName(String themeName) {
    return ElegantTheme.switchToThemeByName(this, themeName);
  }

  bool switchThemeMode() {
    return ElegantTheme.switchThemeMode(this);
  }

  bool switchToSystemThemeMode() {
    return ElegantTheme.switchToSystemThemeMode(this);
  }

  bool switchToDarkThemeMode() {
    return ElegantTheme.switchToDarkThemeMode(this);
  }

  bool switchToLightThemeMode() {
    return ElegantTheme.switchToLightThemeMode(this);
  }

  List<({String? description, String name})>
      get elegantThemeNameAndDescriptionRecordList {
    return ElegantTheme.getElegantThemeNameAndDescriptionRecordList(this);
  }

  ({String? description, String name})
      get currentElegantThemeNameAndDescriptionRecord {
    return ElegantTheme.getCurrentElegantThemeNameAndDescriptionRecord(this);
  }
}

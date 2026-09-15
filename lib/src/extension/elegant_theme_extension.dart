import 'package:elegant_theme/elegant_theme.dart';
import 'package:material_ui/material_ui.dart';

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
    return ElegantTheme.isDark(this);
  }

  bool get isLightThemeMode {
    return ElegantTheme.isLight(this);
  }

  bool get isSystemThemeMode {
    return ElegantTheme.isSystem(this);
  }

  bool nextTheme() {
    return ElegantTheme.nextTheme(this);
  }

  bool setThemeByIndex({required int index}) {
    return ElegantTheme.setThemeByIndex(this, index: index);
  }

  void saveTheme({ThemeMode? themeMode, int? themeIndex, bool? switchTo}) {
    return ElegantTheme.saveTheme(this,
        themeIndex: themeIndex, themeMode: themeMode, switchTo: switchTo);
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

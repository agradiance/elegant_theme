part of "../providers/elegant_theme.dart";

class _ElegantThemeModel with ChangeNotifier {
  int _currentThemeIndex;
  ThemeMode themeMode;
  bool saveChanges = true;

  late final List<ElegantThemeData> themeData;

  _ElegantThemeModel({
    List<ElegantThemeData>? data,
    int? currentThemeIndex,
    ThemeMode? themeMode,
    this.saveChanges = true,
  })  : assert(data != null && data.isNotEmpty),
        themeData = data!,
        themeMode = themeMode ?? ThemeMode.dark,
        _currentThemeIndex = currentThemeIndex ?? 0 {
    saveThemeChanges();
  }

  ThemeData get theme => switch (themeMode) {
        ThemeMode.light => themeData[_currentThemeIndex].light,
        ThemeMode.dark => themeData[_currentThemeIndex].dark,
        ThemeMode.system => themeData[_currentThemeIndex].light,
      };
  List<ElegantThemeData> get data => themeData;

  void saveThemeChanges({ThemeMode? mode, int? themeIndex}) async {
    if (saveChanges) {
      await ElegantTheme._saveThemeIndex(value: _currentThemeIndex);
      await ElegantTheme._saveThemeMode(mode: themeMode);

      ElegantTheme.initialize();
    }
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
    saveThemeChanges();
  }

  bool _nextTheme() {
    final length = data.length;
    if (length > 1) {
      _currentThemeIndex = (_currentThemeIndex + 1) % length;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool _setThemeByIndex({required int index}) {
    final length = data.length;
    if (0 <= index && index < length) {
      _currentThemeIndex = index;
      notifyListeners();
      return true;
    }
    return false;
  }

  List<({String? description, String name})>
      get elegantThemeNameAndDescriptionRecordList {
    return themeData.map(
      (e) {
        return (name: e.name, description: e.description);
      },
    ).toList();
  }

  ({String? description, String name})
      get currentElegantThemeNameAndDescriptionRecord {
    final theme = themeData[_currentThemeIndex];
    return (name: theme.name, description: theme.description);
  }

  bool setThemeByName(String themeName) {
    final index = themeData.indexWhere((element) => element.name == themeName);
    if (index != -1) {
      _currentThemeIndex = index;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  bool _switchThemeMode() {
    if (themeMode == ThemeMode.dark || themeMode == ThemeMode.system) {
      themeMode = ThemeMode.light;
      notifyListeners();
      return true;
    } else if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool _setSystemThemeMode() {
    if (themeMode != ThemeMode.system) {
      themeMode = ThemeMode.system;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool _setLightThemeMode() {
    if (themeMode != ThemeMode.light) {
      themeMode = ThemeMode.light;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool _setDarkThemeMode() {
    if (themeMode != ThemeMode.dark) {
      themeMode = ThemeMode.dark;
      notifyListeners();
      return true;
    }
    return false;
  }
}

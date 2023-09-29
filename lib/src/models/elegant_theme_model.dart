part of "../providers/elegant_theme_provider.dart";

class _ElegantThemeModel with ChangeNotifier {
  int _currentThemeIndex = 0;

  late ElegantThemeData themeData;
  late ElegantThemeController controller;

  ThemeData get theme => themeData.data[_currentThemeIndex];
  List<ThemeData> get data => themeData.data;

  _ElegantThemeModel({
    required List<ThemeData> data,
  })  : assert(data.isNotEmpty),
        themeData = ElegantThemeData(data: data) {
    controller = ElegantThemeController(
      nextTheme: _nextTheme,
    );
  }

  void _nextTheme() {
    final length = data.length;
    if (length > 1) {
      _currentThemeIndex = (_currentThemeIndex + 1) % length;
      notifyListeners();
    }
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:elegant_theme/src/extension/elegant_theme_extension.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/elegant_theme_data.dart';
part '../models/elegant_theme_model.dart';

typedef ElegantScheme = FlexScheme;

class ElegantTheme extends StatefulWidget {
  const ElegantTheme({
    super.key,
    required this.builder,
    required this.themes,
  }) : assert(themes != null && themes.length > 0);

  final Widget Function(BuildContext context, ThemeData theme, ThemeMode themeMode) builder;
  final List<ElegantThemeData>? themes;

  static bool switchToThemeByName(BuildContext context, String themeName) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).setThemeByName(themeName);
  }

  static ThemeData dataOf(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: true).theme;
  }

  static ThemeMode modeOf(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).themeMode;
  }

  static ElegantTheme of(BuildContext context) {
    return context.findAncestorWidgetOfExactType<ElegantTheme>() ?? (throw Exception('ElegantTheme not found in the widget tree.'));
  }

  static List<({String? description, String name})> getElegantThemeNameAndDescriptionRecordList(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).elegantThemeNameAndDescriptionRecordList;
  }

  static ({String? description, String name}) getCurrentElegantThemeNameAndDescriptionRecord(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).currentElegantThemeNameAndDescriptionRecord;
  }

  static bool nextTheme(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)._nextTheme();
  }

  static bool switchThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)._switchThemeMode();
  }

  static bool switchToSystemThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)._setSystemThemeMode();
  }

  static bool switchToLightThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)._setLightThemeMode();
  }

  static bool switchToDarkThemeMode(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false)._setDarkThemeMode();
  }

  @override
  State<ElegantTheme> createState() => _ElegantThemeProviderState();
}

class _ElegantThemeProviderState extends State<ElegantTheme> {
  late final _ElegantThemeModel _elegantThemeModel;

  @override
  void initState() {
    super.initState();
    _elegantThemeModel = _ElegantThemeModel(
      data: widget.themes,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _elegantThemeModel,
      child: Builder(
        builder: (context) {
          return widget.builder(context, context.elegantThemeData, context.elegantThemeMode);
        },
      ),
    );
  }
}

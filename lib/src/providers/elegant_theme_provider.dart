import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/elegant_theme_controller.dart';
import '../models/elegant_theme_data.dart';

part '../models/elegant_theme_model.dart';

class ElegantTheme extends StatefulWidget {
  const ElegantTheme({
    super.key,
    required this.child,
    required this.themes,
  });

  final Widget child;
  final List<ThemeData> themes;

  static ThemeData themeOf(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: true).theme;
  }

  static ElegantThemeController controllerOf(BuildContext context) {
    return Provider.of<_ElegantThemeModel>(context, listen: false).controller;
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
          return widget.child;
        },
      ),
    );
  }
}

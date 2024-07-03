import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/elegant_theme_controller.dart';
import '../models/elegant_theme_data.dart';

part '../models/elegant_theme_model.dart';
part '../extension/elegant_theme_extension.dart';

typedef ElegantScheme = FlexScheme;

class ElegantTheme extends StatefulWidget {
  const ElegantTheme({
    super.key,
    required this.builder,
    required this.themes,
  });

  final Widget Function(BuildContext context) builder;
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
        builder: widget.builder,
      ),
    );
  }
}

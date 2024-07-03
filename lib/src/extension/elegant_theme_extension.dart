// ignore_for_file: unused_element

part of '../providers/elegant_theme_provider.dart';

extension BuildContextExtension on BuildContext {
  ThemeData get elegantThemeData {
    return ElegantTheme.themeOf(this);
  }

  ElegantThemeController get elegantThemeController {
    return ElegantTheme.controllerOf(this);
  }
}

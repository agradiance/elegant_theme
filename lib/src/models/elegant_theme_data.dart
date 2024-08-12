import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class ElegantThemeData {
  final String name;
  final String? description;
  final ThemeData light;
  final ThemeData dark;

  ElegantThemeData._({
    required this.name,
    this.description,
    required this.light,
    required this.dark,
  });

  ElegantThemeData.fromThemeData({
    required this.name,
    this.description,
    required this.light,
    required this.dark,
  });

  factory ElegantThemeData.fromColorScheme({
    required final String name,
    final String? description,
    required ColorScheme colorScheme,
    bool useMaterial3 = true,
  }) {
    return ElegantThemeData._(
      name: name,
      description: description,
      light: FlexThemeData.light(colorScheme: colorScheme, useMaterial3: useMaterial3),
      dark: FlexThemeData.dark(colorScheme: colorScheme, useMaterial3: useMaterial3),
    );
  }

  factory ElegantThemeData.fromFlexScheme({
    required final String name,
    final String? description,
    required FlexScheme flexScheme,
    bool useMaterial3 = true,
  }) {
    return ElegantThemeData._(
      name: name,
      description: description,
      light: FlexThemeData.light(scheme: flexScheme, useMaterial3: useMaterial3),
      dark: FlexThemeData.dark(scheme: flexScheme, useMaterial3: useMaterial3),
    );
  }

  @override
  bool operator ==(covariant ElegantThemeData other) {
    if (identical(this, other)) return true;

    return other.name == name && other.description == description && other.light == light && other.dark == dark;
  }

  @override
  int get hashCode {
    return name.hashCode ^ description.hashCode ^ light.hashCode ^ dark.hashCode;
  }

  ElegantThemeData copyWith({
    String? name,
    String? description,
    ThemeData? light,
    ThemeData? dark,
  }) {
    return ElegantThemeData._(
      name: name ?? this.name,
      description: description ?? this.description,
      light: light ?? this.light,
      dark: dark ?? this.dark,
    );
  }
}

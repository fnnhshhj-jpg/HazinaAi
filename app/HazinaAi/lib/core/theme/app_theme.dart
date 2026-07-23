import 'package:flutter/material.dart';

import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  AppTheme._();

  /// Light Theme
  static ThemeData get lightTheme => LightTheme.theme;

  /// Dark Theme
  static ThemeData get darkTheme => DarkTheme.theme;
}
import 'package:chatapp/themes/dark_mode.dart';
import 'package:chatapp/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeProvider extends StateNotifier<ThemeData> {
  ThemeProvider() : super(darkMode);

  bool get isDarkMode => state == darkMode;

  void toggleTheme() {
    state = state == darkMode ? lightMode : darkMode;
  }
}

final themeProvider = StateNotifierProvider<ThemeProvider, ThemeData>((ref) => ThemeProvider());
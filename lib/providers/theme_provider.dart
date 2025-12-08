import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final SharedPreferences prefs;

  ThemeMode themeMode = ThemeMode.light;

  ThemeProvider(this.prefs) {
    bool isDark = prefs.getBool('isDarkMode') ?? false;
    themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
  }

  bool get isDark => themeMode == ThemeMode.dark;

void toggleTheme(bool value) {
  themeMode = value ? ThemeMode.dark : ThemeMode.light;
  prefs.setBool('isDarkMode', value);
  notifyListeners();
}

}

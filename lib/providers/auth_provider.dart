import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final SharedPreferences prefs;
  Future<bool> register(String email, String password) async {
    await Future.delayed(Duration(seconds: 1));

    // Dummy: berhasil kalau input tidak kosong
    if (email.isNotEmpty && password.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  String? userEmail;

  AuthProvider(this.prefs) {
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  }

  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    prefs.setBool('isLoggedIn', true);
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    prefs.setBool('isLoggedIn', false);
    notifyListeners();
  }
}

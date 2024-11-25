import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ThemeProvider bisa pake semua fitur ChangeNotifier
class ThemeProvider extends ChangeNotifier{
  bool _isDarkTheme = false; //sebuah Setter, bukan var biasa

  ThemeProvider() {
    _loadTheme();
  }

  // Getter => Setter, harus mirip dan setara(tipe datanya)
  bool get isDarkTheme => _isDarkTheme;

  // set isDarkTheme(bool value) triggering user akan melakukan action perubahan tema
  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool("isDarkTheme", isDark);
    // budak nya ChangeNotifier. gak bakal kerja kalo ngga dipanggil. me-record perubahan yang terjadi pada state.
    notifyListeners();
  }

  // ketika perubahannya di load, menghasilkan result
  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ?? => elvis operator: for defining a default value in our variable (to avoid NPE [null pointer exeption])
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}
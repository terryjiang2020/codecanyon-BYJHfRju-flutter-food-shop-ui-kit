import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool? _isDarkTheme = false;
  bool? get isDarkTheme => _isDarkTheme;
  set isDarkTheme (bool? val){
    _isDarkTheme = val;
    notifyListeners();
  }
  Future<dynamic> changeTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkTheme = !_isDarkTheme!;
    await prefs.setBool('darkTheme', _isDarkTheme!);

    notifyListeners();
  }
}

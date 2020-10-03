import 'package:flutter/material.dart';
import 'package:muze/utils/config.dart';

class MyTheme with ChangeNotifier {
  static bool _isLight = true;

  MyTheme() {
    if (box.containsKey('currentTheme'))
      _isLight = box.get('currentTheme');
    else
      box.put('currentTheme', _isLight);
  }
  ThemeMode currentTheme() {
    return _isLight ? ThemeMode.light : ThemeMode.dark;
  }

  void switchTheme() {
    _isLight = !_isLight;
    notifyListeners();
  }
}

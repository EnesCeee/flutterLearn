import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/theme/light_theme.dart';

class ThemeNotifer extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners();
  }

  ThemeData get currentTheme => !isLightTheme ? LightTheme().theme : ThemeData.dark();
}

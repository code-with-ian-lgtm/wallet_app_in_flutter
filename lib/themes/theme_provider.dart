import 'package:flutter/material.dart';
import 'package:wallet_app/themes/dark_mode.dart';
import 'package:wallet_app/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier{
    //set initial theme
    ThemeData _themeData = lightMode;

    ThemeProvider(){
        setInitialTheme();
    }

    //getter theme
    ThemeData get themeData => _themeData;

    //getter darkMode
    bool get isDakMode => _themeData == darkMode;

   set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
   }

   void toggleTheme(){
    if(_themeData == lightMode){
        themeData = darkMode;
    } else {
        themeData = lightMode;
    }
   }

   void setInitialTheme(){
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    if (brightness == Brightness.light){
        themeData = lightMode;
    } else {
        themeData = darkMode;
    }
   }

    
}
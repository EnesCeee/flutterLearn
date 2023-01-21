import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();

  late final ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      
      appBarTheme: const AppBarTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
          )
      ),
      scaffoldBackgroundColor: Colors.white.withOpacity(0.7),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.green,
        ),

        buttonTheme: ButtonThemeData(colorScheme: ColorScheme.light(
          onPrimary: Colors.purple,
          onSecondary: _lightColor._perfume,
        )) ,

        colorScheme: const ColorScheme.light(),

        checkboxTheme: const CheckboxThemeData(
          fillColor: MaterialStatePropertyAll(Colors.green),
        ),

        textTheme:
            ThemeData.light().textTheme.copyWith(subtitle1: TextStyle(fontSize: 20, color: _lightColor._textColor,)));
  }
}

class _LightColor {
  final Color _textColor = Colors.black;
    final Color _perfume = const Color(0xffE0C8F9);

}


//_lighColor direk kullanamayız neden ? 
//çünkü bu value daha run time da initialize olacak

//onun için theme late atıp bir constructrer LightTheme
//atarız ve onun içinde kullanırız

//debug modda değişiklik yapacaksan  final kaldır yapar.
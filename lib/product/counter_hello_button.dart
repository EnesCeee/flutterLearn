import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({super.key});

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterCustom = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;

  void _updateCounter() {
    _counterCustom++;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _updateCounter,
      child: Text('$_welcomeTitle  $_counterCustom'),
    );
  }
}


//başka bir component ana komponentleri etkilemesin mesela bu işi 
//statefullLearn çağırsaydık sayfayı setstate yapmış olacaktık 
//ve sayfayı çokca çağırmış olacaktık ama burda sadece bu componenti
//çağırmış olduk.
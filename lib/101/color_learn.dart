import 'package:flutter/material.dart';

class ColorLearnView extends StatelessWidget {
  const ColorLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Theme.of(context).errorColor,
        child: Text(
          'data',
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}

class ColorsItems {
  final Color amber = Colors.amber;
  final Color fruitSalad=const Color(0xff589546);
}

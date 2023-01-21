import 'package:flutter/material.dart';
import 'package:flutter_application_1/product/counter_hello_button.dart';

//değişmez kısım
//dışarıdan data al ver kısmı
//dışarıyla haberleştiğimiz yer
class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

//asıl işlemlerinizi yaptığımız yer
class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;

  void _updateCounter(bool isIncrement) {
    if (isIncrement == true) {
      _countValue++;
    } else {
      _countValue--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_incrementButton(), _deincrementButton()],
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              _countValue.toString(),
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          const CounterHelloButton(),
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: (() {
        _updateCounter(true);
      }),
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: (() {
          _updateCounter(false);
        }),
        child: const Icon(Icons.remove),
      ),
    );
  }
}

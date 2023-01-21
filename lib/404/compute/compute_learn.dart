
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ComputeLearnView extends StatefulWidget {
  const ComputeLearnView({super.key});

  @override
  State<ComputeLearnView> createState() => _ComputeLearnViewState();
}

class _ComputeLearnViewState extends State<ComputeLearnView> {
  int _result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
          setState(() async {
            _result =await compute(Calculator.sum,100000000);
          });
        },
      ),
    );
  }
}

class Calculator {
  static int sum(int limit) {
    int result = 0;
    for (var i = 0; i < limit; i++) {
      result = i * i;
    }
    return result;
  }
}


//libaray kısmını yapmadım
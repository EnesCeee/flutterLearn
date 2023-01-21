import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({super.key});

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();
  FocusNode focusNodeTextFieldOne = FocusNode();
  FocusNode focusNodeTextFieldTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(),
      body: Column(
        children: [
          TextField(
            maxLength: 20,
            buildCounter: (BuildContext context, {int? currentLength, bool? isFocused, int? maxLength}) {
              return AnimatedContainer(
                key: key,
                duration: const Duration(milliseconds: 100),
                height: 10,
                width: 10.0 * (currentLength ?? 0),
                color: Colors.green[100 * ((currentLength ?? 0) ~/ 2)],
              );
            },
            decoration: _InputDecarotor().emailInput ,
            keyboardType: TextInputType.emailAddress,
            autofillHints: const [AutofillHints.email],
            inputFormatters: [TextProjectInputFormatter()._formatter],
            focusNode: focusNodeTextFieldOne,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            focusNode: focusNodeTextFieldTwo,
          )
        ],
      ),
    );
  }
}

class TextProjectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    }
    return oldValue;
  });
}

class _InputDecarotor {
  final emailInput = const InputDecoration(
      prefixIcon: Icon(Icons.mail),
      border: OutlineInputBorder(),
      labelText: LanguageItems.mailTitle,
      fillColor: Colors.red);
}

// yine main de her Text field için inputDecoration var 
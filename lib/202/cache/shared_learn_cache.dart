import 'package:flutter/material.dart';
import 'package:flutter_application_1/202/cache/shared_manager.dart';

import 'user_model.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String data) {
    final value = int.tryParse(data);
    if (value != null) {
      setState(() {
        _currentValue = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_loading(context)],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_saveValueButton(), _removeValueButton()],
      ),
      body: Column(
        children: [
          TextField(onChanged: ((value) {
            _onChangeValue(value);
          })),
        ],
      ),
    );
  }
 
  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(child: CircularProgressIndicator(color: Theme.of(context).scaffoldBackgroundColor))
        : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        changeLoading();
      },
    );
  }
}



//dummy item bu şekilde yap asıl classtan list türet
class UserItems {
  late final List<User> users;
  UserItems() {
    users = [User('vb', '101', 'vb10.dev'), User('vb2', '102', 'vb10.dev'), User('vb3', '103', 'vb10.dev')];
  }
}

//Generic T
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}



//shared preference nerede kullanıcağımızı bilelim
//basit verilerde ancak kullanılabiliriz
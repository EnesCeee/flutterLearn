// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_application_1/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter,users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager(); 

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) throw SharedNotInitializeException();
  }

  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }

  List<String>? getStringItems(
    SharedKeys key,
  ) {
    _checkPreferences();
    return preferences?.getStringList(
      key.name,
    );
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}


//key counter diyelim 3. bir adam geldi projeye baktı ne anlasın
//hemen enum yap
//method alıcısını SharedKeys yaptık key verdik artık key.name alırız


 // SharedManager(); illa yazmamıza gerek yok zaten default ta var boş constructor
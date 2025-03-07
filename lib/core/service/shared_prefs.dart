import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  void save({required String value, required String key,}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> read ({required String key}) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';


  }
}

import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> saveData(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, data);
  }

  static Future<String?> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static SharedPreferences? prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void set({required String key,required dynamic value}) {
    if (value is int) {
      prefs?.setInt(key, value);
    } else if (value is double) {
      prefs?.setDouble(key, value);
    } else if (value is bool) {
      prefs?.setBool(key, value);
    } else if (value is String) {
      prefs?.setString(key, value);
    } else if(value is List<String>) {
      prefs?.setStringList(key, value);
    }
  }

  static dynamic get({required String key,}){
   return prefs?.get(key);
  }

  static void remove({required String key}){
    prefs?.remove(key);
  }

  static void clear(){
    prefs?.clear();
  }
}
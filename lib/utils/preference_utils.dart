import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static  PreferenceUtils? _instance;
  static  SharedPreferences? _preferences;

  static const String userKey = 'user';
  static const String userToken = 'token';
  static const String userId = 'id';

  static PreferenceUtils getInstance() {
    if (_instance == null) {
      _instance = PreferenceUtils();
    }
    if(_preferences == null) init();
    return _instance!;
  }

  static init() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  static initSharedPreference() {}

  dynamic getData(String key) {
    var value = _preferences!.get(key);
    // print('PreferenceUtils: getData. key: $key value: $value');
    return value;
  }

  dynamic saveStringData<T>(String key, T content) {
    // print('PreferenceUtils: saveStringData. key: $key value: $content');
    if (content is String) {
      _preferences!.setString(key, content);
    }
  }

  Future<void> removeWithKey(String key) async {
    await _preferences!.remove(key);
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }
}

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_interface.dart';

class LocalStorageShared implements IStorage {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  delete(String key) async {
    _prefs.then((SharedPreferences prefs) {
      return prefs.remove(key);
    });
  }

  @override
  get(String key) async {
    return _prefs.then((SharedPreferences prefs) {
      return prefs.getString(key);
    });
  }

  @override
  put(String key, String value) async {
    _prefs.then((SharedPreferences prefs) {
      prefs.setString(key, value);
    });
  }
}
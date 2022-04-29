import 'storage_interface.dart';

class LocalStorageMock implements IStorage {
  final Map<String, String> _storage = {};

  @override
  delete(String key) async {
    _storage.remove(key);
  }

  @override
  get(String key) async {
   return _storage[key];
  }

  @override
  put(String key, String value) async {
    _storage[key] = value;
  }
}
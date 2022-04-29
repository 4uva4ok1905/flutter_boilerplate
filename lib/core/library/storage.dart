import 'storage/storage_interface.dart';

class AppStorageClient {
  final IStorage _provider;

  AppStorageClient(this._provider);

  Future<String?> get(key) async {
    return _provider.get(key);
  }

  Future<void> put(key, value) async {
    _provider.put(key, value);
  }

  Future<void> delete(key) async {
    _provider.delete(key);
  }
}

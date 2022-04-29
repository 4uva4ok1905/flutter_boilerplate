import '../api/auth_api.dart';
import '../library/storage.dart';

class AuthService {
  final AuthApi authApiClient;
  final AppStorageClient appStorageClient;

  AuthService(this.authApiClient, this.appStorageClient);
}
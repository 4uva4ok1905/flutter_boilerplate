import 'package:flutter/material.dart';

import '../ui/widgets/app/app_language_model.dart';
import '../ui/widgets/splash/splash_view_model.dart';
import 'api/auth_api.dart';
import 'config.dart';
import 'library/api.dart';
import 'library/api/api_dio.dart';
import 'library/api/api_interface.dart';
import 'library/router.dart';
import 'library/router/router_default.dart';
import 'library/storage.dart';
import 'library/storage/storage_interface.dart';
import 'library/storage/storage_share.dart';
import 'screen.dart';
import 'services/auth_service.dart';
import 'services/locale_service.dart';

class DIContainer {
  static final DIContainer _diContainer = DIContainer._internal();

  factory DIContainer() {
    return _diContainer;
  }

  DIContainer._internal();

  // PROVIDERS
  final IApi _httpClientProvider = ApiDio();
  final IStorage _storageClientProvider = LocalStorageShared();

  // GLOBAL
  AppHttpClient _appHttpClient() =>
      AppHttpClient(_httpClientProvider, Config.host);

  AppStorageClient _appStorageClient() =>
      AppStorageClient(_storageClientProvider);

  AppScreen appScreen() => AppScreen(this);

  AppRouter appRouter() => AppRouter(RouterDefault(appScreen()));

  // API
  AuthApi _authApi() => AuthApi(
        _appHttpClient(),
      );

  // SERVICES
  AuthService _appAuthService() => AuthService(
        _authApi(),
        _appStorageClient(),
      );

  LocaleService _appLocaleService() => LocaleService(
    _appStorageClient(),
  );

  // VIEW MODEL
  AppLanguageModel appLanguageModel(BuildContext context) => AppLanguageModel(
    context: context,
    localeService:  _appLocaleService()
  );

  SplashViewModel splashViewModel(BuildContext context) => SplashViewModel(
    context: context,
  );
}

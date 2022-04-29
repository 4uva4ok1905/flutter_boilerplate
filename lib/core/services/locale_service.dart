import 'package:flutter/material.dart';

import '../helpers/app_helpers.dart';
import '../library/storage.dart';

class LocaleService {
  AppStorageClient appStore;

  LocaleService(this.appStore);

  static final String _defaultLocale = AppHelpers.locale.languageCode;

  static const fallbackLocale = Locale('en');

  static const List<Locale> supportedLocales = <Locale>[
    Locale('uk'),
    Locale('ru'),
    Locale('en'),
  ];

  bool setLocale(Locale locale) {
    if (LocaleService.supportedLocales.contains(locale)) {
      appStore.put('locale', locale.languageCode);

      return true;
    }

    return false;
  }

  Future<Locale> getLocale() async {
    final code = await appStore.get('locale');

    if (code != null && _existsLocale(code)) {
      return Locale(code);
    }

    if (_existsLocale(_defaultLocale)) {
      return Locale(_defaultLocale);
    }

    return LocaleService.fallbackLocale;
  }

  Future<String> getLocalCode() async {
    final locale = await getLocale();

    return locale.languageCode == 'uk' ? 'ua' : locale.languageCode;
  }

  bool _existsLocale(String code) {
    bool exists = false;

    for (var element in supportedLocales) {
      if (element.languageCode == code) {
        exists = true;
      }
    }

    return exists;
  }
}

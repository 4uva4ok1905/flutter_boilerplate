import 'package:flutter/material.dart';

import '../../../core/services/locale_service.dart';

class AppLanguageModel extends ChangeNotifier {
  final BuildContext context;
  final LocaleService localeService;

  AppLanguageModel({
    required this.context,
    required this.localeService,
  }) {
    asyncInit();
  }

  Locale _locale = LocaleService.fallbackLocale;


  set locale(Locale value) {
    if (localeService.setLocale(value)) {
      _locale = value;

      notifyListeners();
    }
  }

  Locale get locale => _locale;

  Future<void> asyncInit() async {
    _locale = await localeService.getLocale();
  }
}

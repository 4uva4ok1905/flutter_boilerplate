import 'package:doctor/ui/widgets/app/app_language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/library/router.dart';
import '../../../core/routes.dart';
import '../../../core/services/locale_service.dart';

class AppWidget extends StatelessWidget {
  final AppRouter _router;

  const AppWidget(this._router, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: context.read<AppLanguageModel>().locale,
      supportedLocales: LocaleService.supportedLocales,
      routes: _router.routes(),
      initialRoute: Routes.loaderWidget,
      onGenerateRoute: _router.onGenerateRoute,
    );
  }
}

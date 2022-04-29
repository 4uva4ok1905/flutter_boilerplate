import 'package:provider/provider.dart';

import '../ui/widgets/app/app_widget.dart';
import '../ui/widgets/splash/splash_widget.dart';
import 'di.dart';

class AppScreen {
  final DIContainer _diContainer;

  const AppScreen(this._diContainer);

  app() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => _diContainer.appLanguageModel(context),
        )
      ],
      child: AppWidget(_diContainer.appRouter()),
    );
  }

  makeLoader() {
    return Provider(
      create: (context) => _diContainer.splashViewModel(context),
      child: const SplashWidget(),
      lazy: false,
    );
  }
}

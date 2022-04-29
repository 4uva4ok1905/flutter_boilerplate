import 'package:flutter/material.dart';

import '../../routes.dart';
import '../../screen.dart';
import 'router_interface.dart';

class RouterDefault implements IRouter {
  final AppScreen appScreen;

  const RouterDefault(this.appScreen);

  @override
  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      default:
        throw Exception('Router not found');
    }
  }

  @override
  Map<String, Widget Function(BuildContext p1)> routes() {
    return {
      Routes.loaderWidget: (_) => appScreen.makeLoader(),
    };
  }
}

import 'package:flutter/material.dart';

import 'router/router_interface.dart';

class AppRouter {
  final IRouter _provider;

  AppRouter(this._provider);

  Route<Object> onGenerateRoute(settings) {
    return _provider.onGenerateRoute(settings);
  }

  Map<String, Widget Function(BuildContext p1)> routes() {
    return _provider.routes();
  }
}

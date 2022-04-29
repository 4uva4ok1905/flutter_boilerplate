import 'package:flutter/material.dart';

import 'di.dart';

class App {
  final _diContainer = DIContainer();

  Widget makeApp() => _diContainer.appScreen().app();
}
import 'package:flutter/material.dart';

import 'core/app.dart';

final app = App();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final createApp = app.makeApp();

  runApp(createApp);
}
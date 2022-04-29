import 'package:flutter/material.dart';

abstract class IRouter {
  Map<String, Widget Function(BuildContext)> routes();
  Route<Object> onGenerateRoute(RouteSettings settings);
}
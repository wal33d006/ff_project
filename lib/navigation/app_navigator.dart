import 'package:flutter/material.dart';

class AppNavigator {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey(debugLabel: 'AppNavigator Key');

  Future<R?> push<R>(Widget page) => Navigator.of(navigatorKey.currentState!.context).push(
        MaterialPageRoute(
          builder: (context) => page,
        ),
      );

  pushReplacement(Widget page) => Navigator.of(navigatorKey.currentState!.context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page),
        (route) => false,
      );

  close() => Navigator.of(navigatorKey.currentState!.context).pop();

  showAlert(Widget widget) => showDialog(
        context: navigatorKey.currentState!.context,
        builder: (context) => widget,
      );
}

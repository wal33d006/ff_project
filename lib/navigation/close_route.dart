import 'package:ff_project/navigation/app_navigator.dart';

mixin CloseRoute {
  AppNavigator get appNavigator;

  void close() => appNavigator.close();
}

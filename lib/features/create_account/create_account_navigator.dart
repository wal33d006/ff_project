import 'package:ff_project/features/account_details/account_details_navigator.dart';
import 'package:ff_project/navigation/app_navigator.dart';
import 'package:ff_project/navigation/close_route.dart';
import 'package:ff_project/navigation/error_dialog_route.dart';
import 'package:ff_project/navigation/photo_picker_route.dart';

class CreateAccountNavigator with CloseRoute, ErrorDialogRoute, PhotoPickerRoute, AccountDetailsRoute {
  const CreateAccountNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

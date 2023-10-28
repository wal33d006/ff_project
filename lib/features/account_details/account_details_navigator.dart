import 'package:ff_project/features/account_details/account_details_initial_params.dart';
import 'package:ff_project/features/account_details/account_details_page.dart';
import 'package:ff_project/main.dart';
import 'package:ff_project/navigation/app_navigator.dart';
import 'package:ff_project/navigation/close_route.dart';

class AccountDetailsNavigator with CloseRoute {
  const AccountDetailsNavigator(this.appNavigator);

  @override
  final AppNavigator appNavigator;
}

mixin AccountDetailsRoute {
  openAccountDetails(AccountDetailsInitialParams initialParams) {
    appNavigator.push(getIt<AccountDetailsPage>(param1: initialParams));
  }

  AppNavigator get appNavigator;
}

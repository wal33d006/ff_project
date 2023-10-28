import 'package:ff_project/core/domain/models/account.dart';
import 'package:ff_project/features/account_details/account_details_initial_params.dart';

class AccountDetailsPresentationModel {
  final Account account;

  AccountDetailsPresentationModel._({
    required this.account,
  });

  AccountDetailsPresentationModel.initial(
    AccountDetailsInitialParams initialParams,
  ) : account = initialParams.account;

  AccountDetailsPresentationModel copyWith({
    Account? account,
  }) =>
      AccountDetailsPresentationModel._(
        account: account ?? this.account,
      );
}

import 'package:ff_project/features/account_details/account_details_navigator.dart';
import 'package:ff_project/features/account_details/account_details_presentation_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsPresenter extends Cubit<AccountDetailsPresentationModel> {
  final AccountDetailsNavigator _navigator;

  AccountDetailsPresenter(
    AccountDetailsPresentationModel state,
    this._navigator,
  ) : super(state);

  void onTapDone() => _navigator.close();
}

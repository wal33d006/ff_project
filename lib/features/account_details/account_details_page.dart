import 'package:ff_project/features/account_details/account_details_presentation_model.dart';
import 'package:ff_project/features/account_details/account_details_presenter.dart';
import 'package:ff_project/features/create_account/widgets/ff_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountDetailsPage extends StatelessWidget {
  final AccountDetailsPresenter presenter;

  const AccountDetailsPage({
    super.key,
    required this.presenter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: BlocBuilder<AccountDetailsPresenter, AccountDetailsPresentationModel>(
          bloc: presenter,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Congratulations! Your account has been successfully created. Below is your account number',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.account.accountNumber,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: FFButton(
                      label: 'DONE',
                      onTap: presenter.onTapDone,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

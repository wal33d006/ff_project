import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:ff_project/features/account_details/account_details_initial_params.dart';
import 'package:ff_project/features/create_account/create_account_initial_params.dart';
import 'package:ff_project/features/create_account/create_account_presentation_model.dart';
import 'package:ff_project/features/create_account/create_account_presenter.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late CreateAccountPresenter presenter;
  late MockCreateAccountNavigator navigator;
  late MockCreateAccountUseCase createAccountUseCase;

  test(
    'On successful return from use case, the presenter should call navigator to open account details',
    () async {
      final account = CreateAccount(
        firstName: presenter.state.firstName,
        lastName: presenter.state.lastName,
        photo: presenter.state.photoMemory,
        dependents: presenter.state.dependents,
      );
      when(() => createAccountUseCase.execute(account)).thenAnswer(
        (_) => Future.value(
          right(Mocks.account),
        ),
      );

      when(() => navigator.openAccountDetails(any())).thenAnswer(
        (_) => Future.value(),
      );

      await presenter.onTapSubmit();

      verify(() => navigator.openAccountDetails(any()));
    },
  );

  test(
    'On successful return from photo picker, the presenter should update the photo in the state',
    () async {
      when(() => navigator.openPhotoPicker()).thenAnswer(
        (_) => Future.value(Mocks.createAccount.photo),
      );

      await presenter.onTapAddPicture();

      expect(presenter.state.photoMemory, Mocks.createAccount.photo);

      verify(() => navigator.openPhotoPicker());
    },
  );

  setUp(() {
    registerFallbackValue(const CreateAccountInitialParams());
    registerFallbackValue(AccountDetailsInitialParams(account: Mocks.account));
    createAccountUseCase = MockCreateAccountUseCase();

    navigator = MockCreateAccountNavigator();
    presenter = CreateAccountPresenter(
      CreateAccountPresentationModel.initial(const CreateAccountInitialParams()),
      navigator,
      createAccountUseCase,
    );
  });
}

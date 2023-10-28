import 'package:ff_project/core/domain/use_cases/create_account_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late CreateAccountUseCase createAccountUseCase;
  late MockAccountRepository accountRepository;

  test(
    'Use case should return the correct account as returned by the repository',
    () async {
      when(() => accountRepository.createAccount(Mocks.createAccount)).thenAnswer(
        (_) => Future.value(
          right(Mocks.account),
        ),
      );

      var response = await createAccountUseCase.execute(Mocks.createAccount);

      response.map((a) {
        expect(a.accountNumber, Mocks.account.accountNumber);
      });

      verify(() => accountRepository.createAccount(Mocks.createAccount));
    },
  );

  setUp(() {
    accountRepository = MockAccountRepository();
    createAccountUseCase = CreateAccountUseCase(accountRepository);
  });
}

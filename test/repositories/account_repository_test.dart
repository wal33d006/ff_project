import 'package:ff_project/core/data/repositories/aes_encryption_repository.dart';
import 'package:ff_project/core/data/repositories/rest_api_account_repository.dart';
import 'package:ff_project/core/domain/repositories/account_repository.dart';
import 'package:ff_project/core/domain/repositories/encryption_repository.dart';
import 'package:ff_project/network/network_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks.dart';

void main() {
  late AccountRepository accountRepository;
  late NetworkRepository networkRepository;
  late EncryptionRepository encryptionRepository;

  test(
    'Account repository should return correct account number (using original aes encryption repository)',
    () async {
      when(() => networkRepository.post(endpoint: 'account', body: Mocks.encryptedRequestJson))
          .thenAnswer((_) => Future.value(right(Mocks.encryptedResponseJson)));

      var response = await accountRepository.createAccount(Mocks.createAccount);
      //
      response.map((a) {
        expect(a.accountNumber, Mocks.account.accountNumber);
      });
      //
      verify(() => networkRepository.post(endpoint: 'account', body: Mocks.encryptedRequestJson));
    },
  );

  setUp(() {
    registerFallbackValue({});
    networkRepository = MockNetworkRepository();
    encryptionRepository = AesEncryptionRepository();
    accountRepository = RestApiAccountRepository(networkRepository, encryptionRepository);
  });
}

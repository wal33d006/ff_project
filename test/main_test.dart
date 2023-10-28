import 'dart:typed_data';

import 'package:ff_project/core/data/repositories/aes_encryption_repository.dart';
import 'package:ff_project/core/data/repositories/rest_api_account_repository.dart';
import 'package:ff_project/core/data/repositories/rest_network_repository.dart';
import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:ff_project/core/domain/models/dependent.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Repository', () async {
    final restApi = RestApiAccountRepository(RestNetworkRepository(), AesEncryptionRepository());
    final response = await restApi.createAccount(
      CreateAccount(
        firstName: 'Hello',
        lastName: 'Hello',
        photo: Uint8List(0),
        dependents: [Dependent.empty()],
      ),
    );

    print(
      response.fold(
        (l) => print(l.error),
        (r) => print(r.accountNumber),
      ),
    );
  });
}

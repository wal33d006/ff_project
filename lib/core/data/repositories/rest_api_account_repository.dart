import 'dart:convert';

import 'package:ff_project/core/data/models/account_request_json.dart';
import 'package:ff_project/core/data/models/account_response_json.dart';
import 'package:ff_project/core/data/models/encrypted_request_json.dart';
import 'package:ff_project/core/data/models/encrypted_response_json.dart';
import 'package:ff_project/core/domain/failures/create_account_failure.dart';
import 'package:ff_project/core/domain/models/account.dart';
import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:ff_project/core/domain/repositories/account_repository.dart';
import 'package:ff_project/core/domain/repositories/encryption_repository.dart';
import 'package:ff_project/network/network_repository.dart';
import 'package:fpdart/fpdart.dart';

class RestApiAccountRepository implements AccountRepository {
  final NetworkRepository _networkRepository;
  final EncryptionRepository _encryptionRepository;

  const RestApiAccountRepository(
    this._networkRepository,
    this._encryptionRepository,
  );

  @override
  Future<Either<CreateAccountFailure, Account>> createAccount(CreateAccount account) =>
      _encryptionRepository.encrypt(AccountRequestJson.fromDomain(account).toJson().toString()).then(
            (value) => value.fold(
              (l) => left(CreateAccountFailure(error: l.error)),
              (r) => _networkRepository
                  .post(endpoint: 'account', body: EncryptedRequestJson(encryptedRequest: r).toJson())
                  .then(
                    (value) => value.fold(
                      (l) => left(CreateAccountFailure(error: l.error)),
                      (r) => _encryptionRepository.decrypt(EncryptedResponseJson.fromJson(r).encryptedResponse).then(
                            (value) => value.fold(
                              (l) => left(CreateAccountFailure(error: l.error)),
                              (r) => right(AccountResponseJson.fromJson(jsonDecode(r)).toDomain()),
                            ),
                          ),
                    ),
                  ),
            ),
          );
}

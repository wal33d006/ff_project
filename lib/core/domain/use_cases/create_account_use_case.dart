import 'package:ff_project/core/domain/failures/create_account_failure.dart';
import 'package:ff_project/core/domain/models/account.dart';
import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:ff_project/core/domain/repositories/account_repository.dart';
import 'package:fpdart/fpdart.dart';

class CreateAccountUseCase {
  final AccountRepository _accountRepository;

  CreateAccountUseCase(
    this._accountRepository,
  );

  Future<Either<CreateAccountFailure, Account>> execute(CreateAccount account) =>
      _accountRepository.createAccount(account);
}

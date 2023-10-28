import 'package:ff_project/core/domain/failures/create_account_failure.dart';
import 'package:ff_project/core/domain/models/account.dart';
import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:fpdart/fpdart.dart';

abstract class AccountRepository {
  Future<Either<CreateAccountFailure, Account>> createAccount(CreateAccount account);
}

import 'dart:typed_data';
import 'package:ff_project/core/domain/models/account.dart';
import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:ff_project/core/domain/models/dependent.dart';
import 'package:ff_project/core/domain/repositories/account_repository.dart';
import 'package:ff_project/core/domain/use_cases/create_account_use_case.dart';
import 'package:ff_project/features/account_details/account_details_navigator.dart';
import 'package:ff_project/features/create_account/create_account_navigator.dart';
import 'package:ff_project/network/network_repository.dart';
import 'package:mocktail/mocktail.dart';

class Mocks {
  /// Create Account
  static CreateAccount createAccount = CreateAccount(
    firstName: 'firstName',
    lastName: 'lastName',
    photo: Uint8List(16),
    dependents: [Dependent(name: 'name')],
  );

  /// The [encryptedRequestString] corresponds to the [createAccount] field above
  static String encryptedRequestString =
      'J2dLjrUCKyg8Sp9spwKAALM5Yo0UvOHlz/eV+8eqrllW9TW5NnzLXVlIPeE6PcOhPXW45MTkIQWRSekUwVHgo6skRsd1c1zRMJLihOd2PYfORs7TkuQFnxj9bvvm3GOhO7i8uIyMw1xOaanWdbDOrrxgpcwq+eSuh97f2RnuAKgzubI8s8H3i9mckqYLmxKm';
  static Map<String, dynamic> encryptedRequestJson = {"encryptedRequest": encryptedRequestString};

  /// Account response
  static Account account = const Account(accountNumber: '12345');
  static Map<String, dynamic> encryptedResponseJson = {"encryptedResponse": encryptedResponseString};
  static String encryptedResponseString = 'vy+yX5sQ6c0XYI30E4n+gTwpiLtxU9jRhHSnxM4leGU=';
}

// NAVIGATORS
class MockCreateAccountNavigator extends Mock implements CreateAccountNavigator {}

class MockAccountDetailsNavigator extends Mock implements AccountDetailsNavigator {}

// USE CASES
class MockCreateAccountUseCase extends Mock implements CreateAccountUseCase {}

// REPOSITORIES
class MockAccountRepository extends Mock implements AccountRepository {}

class MockNetworkRepository extends Mock implements NetworkRepository {}

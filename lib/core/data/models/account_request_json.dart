import 'package:ff_project/core/domain/models/create_account.dart';

class AccountRequestJson {
  final String requestType;
  final String firstName;
  final String lastName;
  final String photo;
  final List<String> dependents;

  const AccountRequestJson({
    this.requestType = 'new_account',
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.dependents,
  });

  factory AccountRequestJson.fromDomain(CreateAccount account) => AccountRequestJson(
        firstName: account.firstName,
        lastName: account.lastName,
        photo: account.photo,
        dependents: account.dependents,
      );

  Map<String, dynamic> toJson() {
    return {
      'requestType': requestType,
      'firstName': firstName,
      'lastName': lastName,
      'photo': photo,
      'dependents': dependents,
    };
  }
}

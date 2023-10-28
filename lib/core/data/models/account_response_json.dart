import 'package:ff_project/core/domain/models/account.dart';

class AccountResponseJson {
  final String accountNumber;

  const AccountResponseJson({
    required this.accountNumber,
  });

  factory AccountResponseJson.fromJson(Map<String, dynamic> json) => AccountResponseJson(
        accountNumber: json['accountNumber'] as String? ?? '',
      );

  Account toDomain() => Account(accountNumber: accountNumber);
}

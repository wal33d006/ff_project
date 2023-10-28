import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String accountNumber;

  const Account({
    required this.accountNumber,
  });

  factory Account.empty() => const Account(
        accountNumber: '',
      );

  Account copyWith({
    String? accountNumber,
  }) =>
      Account(
        accountNumber: accountNumber ?? this.accountNumber,
      );

  @override
  List<Object?> get props => [accountNumber];
}

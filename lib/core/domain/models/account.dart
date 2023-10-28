import 'package:equatable/equatable.dart';

class Account extends Equatable {
  final String accountNumber;

  const Account({
    required this.accountNumber,
  });

  @override
  List<Object?> get props => [accountNumber];
}

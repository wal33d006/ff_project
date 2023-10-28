import 'package:equatable/equatable.dart';

class CreateAccount extends Equatable {
  final String firstName;
  final String lastName;
  final String photo;
  final List<String> dependents;

  const CreateAccount({
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.dependents,
  });

  factory CreateAccount.empty() => const CreateAccount(
        firstName: '',
        lastName: '',
        photo: '',
        dependents: [],
      );

  CreateAccount copyWith({
    String? firstName,
    String? lastName,
    String? photo,
    List<String>? dependents,
  }) =>
      CreateAccount(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        photo: photo ?? this.photo,
        dependents: dependents ?? this.dependents,
      );

  @override
  List<Object?> get props => [firstName, lastName, photo, dependents];
}

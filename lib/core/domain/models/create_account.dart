import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:ff_project/features/create_account/domain/dependent.dart';

class CreateAccount extends Equatable {
  final String firstName;
  final String lastName;
  final Uint8List photo;
  final List<Dependent> dependents;

  const CreateAccount({
    required this.firstName,
    required this.lastName,
    required this.photo,
    required this.dependents,
  });

  factory CreateAccount.empty() => CreateAccount(
        firstName: '',
        lastName: '',
        photo: Uint8List(0),
        dependents: const [],
      );

  CreateAccount copyWith({
    String? firstName,
    String? lastName,
    Uint8List? photo,
    List<Dependent>? dependents,
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

import 'dart:typed_data';

import 'package:ff_project/features/create_account/create_account_initial_params.dart';
import 'package:ff_project/features/create_account/domain/dependent.dart';

class CreateAccountPresentationModel {
  final bool isLoading;
  final bool isPhotoLoading;
  final List<Dependent> dependents;
  final String firstName;
  final String lastName;
  final Uint8List photoMemory;

  bool get isEnabled {
    var dependentValidation = true;
    for (var d in dependents) {
      if (d.name.isEmpty) {
        dependentValidation = false;
      }
    }
    return firstName.isNotEmpty && lastName.isNotEmpty && photoMemory.isNotEmpty && dependentValidation && !isLoading;
  }

  CreateAccountPresentationModel._({
    required this.isLoading,
    required this.isPhotoLoading,
    required this.dependents,
    required this.firstName,
    required this.lastName,
    required this.photoMemory,
  });

  CreateAccountPresentationModel.initial(CreateAccountInitialParams initialParams)
      : dependents = [],
        isLoading = false,
        isPhotoLoading = false,
        lastName = '',
        firstName = '',
        photoMemory = Uint8List(0);

  CreateAccountPresentationModel copyWith({
    bool? isLoading,
    bool? isPhotoLoading,
    String? firstName,
    String? lastName,
    List<Dependent>? dependents,
    Uint8List? photoMemory,
  }) =>
      CreateAccountPresentationModel._(
        isLoading: isLoading ?? this.isLoading,
        isPhotoLoading: isPhotoLoading ?? this.isPhotoLoading,
        dependents: dependents ?? this.dependents,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        photoMemory: photoMemory ?? this.photoMemory,
      );

  CreateAccountPresentationModel byRemovingDependent(Dependent e) {
    var list = <Dependent>[];
    list.addAll(dependents);
    list.remove(e);

    return copyWith(dependents: list);
  }

  CreateAccountPresentationModel byAddingDependent() {
    var list = <Dependent>[];
    list.addAll(dependents);
    list.add(Dependent.empty());

    return copyWith(dependents: list);
  }

  CreateAccountPresentationModel byUpdatingDependent(String value, Dependent dependent) {
    var list = <Dependent>[];
    list.addAll(dependents);
    list[list.indexOf(dependent)] = list[list.indexOf(dependent)].copyWith(name: value);

    return copyWith(dependents: list);
  }
}

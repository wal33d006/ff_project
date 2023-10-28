import 'package:ff_project/features/create_account/create_account_initial_params.dart';
import 'package:ff_project/features/create_account/domain/dependent.dart';

class CreateAccountPresentationModel {
  final bool isLoading;
  final List<Dependent> dependents;
  final String firstName;
  final String lastName;

  CreateAccountPresentationModel._({
    required this.isLoading,
    required this.dependents,
    required this.firstName,
    required this.lastName,
  });

  CreateAccountPresentationModel.initial(CreateAccountInitialParams initialParams)
      : dependents = [Dependent.empty(), Dependent.empty()],
        isLoading = false,
        lastName = '',
        firstName = '';

  CreateAccountPresentationModel copyWith({
    bool? isLoading,
    String? firstName,
    String? lastName,
    List<Dependent>? dependents,
  }) =>
      CreateAccountPresentationModel._(
        isLoading: isLoading ?? this.isLoading,
        dependents: dependents ?? this.dependents,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
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

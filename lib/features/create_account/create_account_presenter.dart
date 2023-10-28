import 'package:ff_project/features/create_account/create_account_navigator.dart';
import 'package:ff_project/features/create_account/create_account_presentation_model.dart';
import 'package:ff_project/features/create_account/domain/dependent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPresenter extends Cubit<CreateAccountPresentationModel> {
  final CreateAccountNavigator _navigator;

  CreateAccountPresenter(
    CreateAccountPresentationModel state,
    this._navigator,
  ) : super(state);

  onRemoveDependent(Dependent dependent) => emit(state.byRemovingDependent(dependent));

  void onTapAddDependent() => emit(state.byAddingDependent());

  void onChangeFirstName(String value) => emit(state.copyWith(firstName: value));

  void onChangeLastName(String value) => emit(state.copyWith(lastName: value));

  onChangeDependent(String value, Dependent dependent) => emit(state.byUpdatingDependent(value, dependent));
}

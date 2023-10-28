import 'package:ff_project/core/domain/models/create_account.dart';
import 'package:ff_project/core/domain/use_cases/create_account_use_case.dart';
import 'package:ff_project/features/account_details/account_details_initial_params.dart';
import 'package:ff_project/features/create_account/create_account_initial_params.dart';
import 'package:ff_project/features/create_account/create_account_navigator.dart';
import 'package:ff_project/features/create_account/create_account_presentation_model.dart';
import 'package:ff_project/core/domain/models/dependent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPresenter extends Cubit<CreateAccountPresentationModel> {
  final CreateAccountNavigator _navigator;
  final CreateAccountUseCase _createAccountUseCase;

  CreateAccountPresenter(
    CreateAccountPresentationModel state,
    this._navigator,
    this._createAccountUseCase,
  ) : super(state);

  onRemoveDependent(Dependent dependent) => emit(state.byRemovingDependent(dependent));

  void onTapAddDependent() => emit(state.byAddingDependent());

  void onChangeFirstName(String value) => emit(state.copyWith(firstName: value));

  void onChangeLastName(String value) => emit(state.copyWith(lastName: value));

  onChangeDependent(String value, Dependent dependent) => emit(state.byUpdatingDependent(value, dependent));

  void onTapAddPicture() async {
    emit(state.copyWith(isPhotoLoading: true));
    final photoMemoryString = await _navigator.openPhotoPicker();
    if (photoMemoryString != null) {
      emit(state.copyWith(photoMemory: photoMemoryString, isLoading: false));
    }
    emit(state.copyWith(isPhotoLoading: false));
  }

  void onTapSubmit() {
    emit(state.copyWith(isLoading: true));
    _createAccountUseCase
        .execute(
          CreateAccount(
            firstName: state.firstName,
            lastName: state.lastName,
            photo: state.photoMemory,
            dependents: state.dependents,
          ),
        )
        .then(
          (value) => value.fold(
            (l) {
              emit(state.copyWith(isLoading: false));
              _navigator.showError(l.error);
            },
            (account) {
              _navigator.openAccountDetails(AccountDetailsInitialParams(account: account));
              emit(CreateAccountPresentationModel.initial(const CreateAccountInitialParams()));
            },
          ),
        );
  }
}

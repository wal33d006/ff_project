import 'package:ff_project/features/create_account/create_account_presentation_model.dart';
import 'package:ff_project/features/create_account/create_account_presenter.dart';
import 'package:ff_project/features/create_account/widgets/ff_button.dart';
import 'package:ff_project/features/create_account/widgets/ff_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAccountPage extends StatelessWidget {
  final CreateAccountPresenter presenter;

  const CreateAccountPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAccountPresenter, CreateAccountPresentationModel>(
      bloc: presenter,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Flow'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: state.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        if (state.photoMemory.isNotEmpty)
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: MemoryImage(state.photoMemory),
                          )
                        else
                          CircleAvatar(
                            radius: 50,
                            child: InkWell(
                              onTap: presenter.onTapAddPicture,
                              child: const Icon(Icons.add_a_photo, size: 40),
                            ),
                          ),
                        const SizedBox(height: 16),
                        FFTextField(onChanged: presenter.onChangeFirstName, hintText: 'First name'),
                        const SizedBox(height: 8),
                        FFTextField(onChanged: presenter.onChangeLastName, hintText: 'Last name'),
                        const SizedBox(height: 4),
                        ...state.dependents.map(
                          (e) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: FFTextField(
                              onChanged: (value) => presenter.onChangeDependent(value, e),
                              hintText: 'Dependent ${state.dependents.indexOf(e) + 1}',
                              suffixIcon: InkWell(
                                onTap: () => presenter.onRemoveDependent(e),
                                child: const Icon(Icons.remove_circle),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: FFButton(onTap: presenter.onTapAddDependent, label: 'Add dependent'),
                        ),
                      ],
                    ),
                  ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: state.isEnabled ? presenter.onTapSubmit : null,
            backgroundColor: state.isEnabled ? null : Colors.grey[300],
            foregroundColor: state.isEnabled ? null : Colors.black,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Submit'),
          ),
        );
      },
    );
  }
}

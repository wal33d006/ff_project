import 'package:ff_project/features/create_account/create_account_presentation_model.dart';
import 'package:ff_project/features/create_account/create_account_presenter.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                TextFormField(
                  onChanged: presenter.onChangeFirstName,
                  decoration: InputDecoration(hintText: 'First name'),
                ),
                TextFormField(
                  onChanged: presenter.onChangeLastName,
                  decoration: InputDecoration(hintText: 'Last name'),
                ),
                ...state.dependents.map(
                  (e) => TextFormField(
                    onChanged: (value) => presenter.onChangeDependent(value, e),
                    decoration: InputDecoration(
                      hintText: 'Dependent ${state.dependents.indexOf(e) + 1}',
                      suffixIcon: InkWell(
                        onTap: () => presenter.onRemoveDependent(e),
                        child: Icon(Icons.remove_circle),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: presenter.onTapAddDependent,
                  child: Text('Add dependent'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

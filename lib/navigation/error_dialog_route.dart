import 'package:ff_project/navigation/app_navigator.dart';
import 'package:flutter/material.dart';

mixin ErrorDialogRoute {
  Future<void> showError(String failure) => appNavigator.showAlert(ErrorDialog(failure: failure));

  AppNavigator get appNavigator;
}

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    required this.failure,
    Key? key,
  }) : super(key: key);

  final String failure;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(failure),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Dismiss'),
        )
      ],
    );
  }
}

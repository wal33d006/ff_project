import 'package:ff_project/core/data/repositories/aes_encryption_repository.dart';
import 'package:ff_project/core/data/repositories/rest_api_account_repository.dart';
import 'package:ff_project/core/data/repositories/rest_network_repository.dart';
import 'package:ff_project/core/domain/repositories/account_repository.dart';
import 'package:ff_project/core/domain/repositories/encryption_repository.dart';
import 'package:ff_project/core/domain/use_cases/create_account_use_case.dart';
import 'package:ff_project/features/account_details/account_details_initial_params.dart';
import 'package:ff_project/features/account_details/account_details_navigator.dart';
import 'package:ff_project/features/account_details/account_details_page.dart';
import 'package:ff_project/features/account_details/account_details_presentation_model.dart';
import 'package:ff_project/features/account_details/account_details_presenter.dart';
import 'package:ff_project/features/create_account/create_account_initial_params.dart';
import 'package:ff_project/features/create_account/create_account_navigator.dart';
import 'package:ff_project/features/create_account/create_account_page.dart';
import 'package:ff_project/features/create_account/create_account_presentation_model.dart';
import 'package:ff_project/features/create_account/create_account_presenter.dart';
import 'package:ff_project/navigation/app_navigator.dart';
import 'package:ff_project/network/network_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  _registerDependencies();
  runApp(const MyApp());
}

void _registerDependencies() {
  getIt
    ..registerFactory<AppNavigator>(
      () => AppNavigator(),
    )
    ..registerFactory<NetworkRepository>(
      () => RestNetworkRepository(),
    )
    ..registerFactory<EncryptionRepository>(
      () => AesEncryptionRepository(),
    )
    ..registerFactory<AccountRepository>(
      () => RestApiAccountRepository(getIt(), getIt()),
    )
    ..registerFactory<CreateAccountUseCase>(
      () => CreateAccountUseCase(
        getIt(),
      ),
    )
    ..registerFactory<CreateAccountNavigator>(
      () => CreateAccountNavigator(getIt()),
    )
    ..registerFactoryParam<CreateAccountPresentationModel, CreateAccountInitialParams, dynamic>(
      (params, _) => CreateAccountPresentationModel.initial(params),
    )
    ..registerFactoryParam<CreateAccountPresenter, CreateAccountInitialParams, dynamic>(
      (initialParams, _) => CreateAccountPresenter(
        getIt(param1: initialParams),
        getIt(),
        getIt(),
      ),
    )
    ..registerFactoryParam<CreateAccountPage, CreateAccountInitialParams, dynamic>(
      (initialParams, _) => CreateAccountPage(
        presenter: getIt(param1: initialParams),
      ),
    )
    ..registerFactory<AccountDetailsNavigator>(
      () => AccountDetailsNavigator(getIt()),
    )
    ..registerFactoryParam<AccountDetailsPresentationModel, AccountDetailsInitialParams, dynamic>(
      (params, _) => AccountDetailsPresentationModel.initial(params),
    )
    ..registerFactoryParam<AccountDetailsPresenter, AccountDetailsInitialParams, dynamic>(
      (initialParams, _) => AccountDetailsPresenter(
        getIt(param1: initialParams),
        getIt(),
      ),
    )
    ..registerFactoryParam<AccountDetailsPage, AccountDetailsInitialParams, dynamic>(
      (initialParams, _) => AccountDetailsPage(
        presenter: getIt(param1: initialParams),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppNavigator.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: getIt<CreateAccountPage>(param1: const CreateAccountInitialParams()),
    );
  }
}

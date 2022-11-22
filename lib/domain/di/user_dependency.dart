
import 'package:github_list/di/dependency.dart';
import 'package:github_list/domain/datasource/user_remote_datasource.dart';
import 'package:github_list/domain/repository/user_repository.dart';
import 'package:github_list/domain/repository/user_repository_impl.dart';
import 'package:github_list/domain/usecase/user_usecase.dart';
import 'package:github_list/main.dart';
import 'package:github_list/presentation/bloc/user/user_bloc.dart';

class UserDependency {
  UserDependency() {
    _regiterDataSource();
    _registerRepository();
    _registerUseCase();
    _userBloc();
  }

  // Datasource
  void _regiterDataSource() => locator.registerLazySingleton(
      () => UserRemoteDataSource(dio: locator(), sharedPref: locator()));

  // Repository
  void _registerRepository() => locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userRemoteDataSource: locator()));

  // UseCase
  void _registerUseCase() =>
      locator.registerFactory(() => UserUseCase(userRepository: locator()));

  // Bloc
  void _userBloc() => locator.registerFactory(
      () => UserBloc(useCase: locator(), sharedPref: locator()));
}

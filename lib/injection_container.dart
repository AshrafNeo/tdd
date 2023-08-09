import 'package:get_it/get_it.dart';
import 'package:tdd/presentation/bloc/bloc.dart';

import 'data/data.dart';
import 'data/repositories/user_repositories.dart';
import 'domain/repositories/user_repositories.dart';
import 'domain/usecases/login_usecase.dart';

import 'package:http/http.dart' as http;

final getItInstance = GetIt.I;

init() {
  /// BLOCS
  getItInstance.registerFactory(
    () => LoginBloc(
      loginUsecase: getItInstance(),
    ),
  );

  /// USECASE
  getItInstance.registerLazySingleton(
    () => LoginUsecase(
      userRepositories: getItInstance(),
    ),
  );

  /// REPOSITORY
  getItInstance.registerLazySingleton<UserRepositories>(
      () => UserRepositoriesImpl(userRemoteDataSource: getItInstance()));

  /// DATA SOURCE
  getItInstance.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(client: getItInstance()),
  );

  getItInstance.registerLazySingleton(() => http.Client());
}

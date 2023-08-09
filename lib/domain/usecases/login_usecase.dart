import 'package:tdd/domain/entities/user_entities.dart';
import 'package:tdd/domain/repositories/user_repositories.dart';
import 'package:tdd/domain/usecases/usecases.dart';

class LoginUsecase extends UseCase<UserEntity, LoginParams> {
  final UserRepositories userRepositories;

  LoginUsecase({required this.userRepositories});

  @override
  Future<UserEntity> call({required LoginParams params}) async {
    try {
      return await userRepositories.userLogin(userEntity: params.userEntity);
    } catch (e) {
      rethrow;
    }
  }
}

class LoginParams {
  final UserEntity userEntity;

  LoginParams(this.userEntity);
}

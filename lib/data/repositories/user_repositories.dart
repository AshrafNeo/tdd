import 'package:tdd/data/data.dart';
import 'package:tdd/domain/entities/user_entities.dart';
import 'package:tdd/domain/repositories/user_repositories.dart';

class UserRepositoriesImpl extends UserRepositories {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoriesImpl({required this.userRemoteDataSource});

  @override
  Future<UserEntity> userLogin({required UserEntity userEntity}) async {
    try {
      return await userRemoteDataSource.userLogin(
        userModel: UserModel.fromEntity(userEntity),
      );
    } catch (e) {
      rethrow;
    }
  }
}

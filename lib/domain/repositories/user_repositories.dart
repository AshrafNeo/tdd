import 'package:tdd/domain/domain.dart';

abstract class UserRepositories {
  Future<UserEntity> userLogin({required UserEntity userEntity});
}

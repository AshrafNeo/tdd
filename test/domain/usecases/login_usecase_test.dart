import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/domain/entities/entities.dart';
import 'package:tdd/domain/repositories/user_repositories.dart';
import 'package:tdd/domain/usecases/login_usecase.dart';

import 'login_usecase_test.mocks.dart';

@GenerateMocks([UserRepositories])
void main() {
  late LoginUsecase loginUsecase;
  late MockUserRepositories mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepositories();
    loginUsecase = LoginUsecase(userRepositories: mockUserRepository);
  });

  const tUserEntity = UserEntity(email: "email", password: "password");

  test("login use case", () async {
    //arrange
    when(
      mockUserRepository.userLogin(
        userEntity: const UserEntity(email: "email", password: "password"),
      ),
    ).thenAnswer(
      (_) => Future.value(tUserEntity),
    );

    //act
    final result = await loginUsecase(params: LoginParams(tUserEntity));

    expect(result, tUserEntity);

    verify(mockUserRepository.userLogin(userEntity: tUserEntity));
    verifyNoMoreInteractions(mockUserRepository);
  });
}

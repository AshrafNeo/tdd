import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/data/data.dart';

import 'package:tdd/data/repositories/user_repositories.dart';

import 'user_repositories_test.mocks.dart';

class MockRemoteDataSource extends Mock implements UserRemoteDataSource {}

@GenerateMocks([MockRemoteDataSource])
void main() {
  const tUserModel = UserModel(email: "email", password: "password");
  late UserRepositoriesImpl userRepositoriesImpl;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockMockRemoteDataSource();
    userRepositoriesImpl =
        UserRepositoriesImpl(userRemoteDataSource: mockRemoteDataSource);
  });

  group("mock remote data source", () {
    test("must return success", () async {
      when(mockRemoteDataSource.userLogin(userModel: tUserModel))
          .thenAnswer((_) async => tUserModel);

      final result =
          await userRepositoriesImpl.userLogin(userEntity: tUserModel);

      expect(result, equals(tUserModel));
    });
  });
}

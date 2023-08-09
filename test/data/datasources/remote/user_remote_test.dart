import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd/data/data.dart';

import 'user_remote_test.mocks.dart';

//MockSpec<http.Client>(onMissingStub: OnMissingStub.returnDefault)
@GenerateMocks([http.Client])
void main() {
  const user = UserModel(email: "email", password: "password", name: "mock");
  late UserRemoteDataSourceImpl userRemoteDataSourceImpl;
  late MockClient client;
  //late Mock
  setUp(() {
    client = MockClient();
    userRemoteDataSourceImpl = UserRemoteDataSourceImpl(client: client);
  });

  group("Should return response ", () {
    test("should return 200 response", () async {
      when(
        client.post(
          Uri.https(
              "flutter-tdd-f94ac-default-rtdb.asia-southeast1.firebasedatabase.app",
              'user-list.json'),
          body: jsonEncode(
            user.toJson(),
          ),
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response('{"name": "mock"}', 200),
      );

      expect(await userRemoteDataSourceImpl.userLogin(userModel: user),
          isA<UserModel>());
    });

    test("should return 404 response", () async {
      when(
        client.post(
          Uri.https(
              "flutter-tdd-f94ac-default-rtdb.asia-southeast1.firebasedatabase.app",
              'user-list.json'),
          body: jsonEncode(
            user.toJson(),
          ),
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      ).thenAnswer(
        (_) async => http.Response('{"name": "mock"}', 404),
      );

      expect(
        userRemoteDataSourceImpl.userLogin(userModel: user),
        throwsException,
      );
    });
  });
}

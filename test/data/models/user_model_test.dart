import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/data/data.dart';
import 'package:tdd/domain/entities/entities.dart';

import '../../fixtures/fixtures_reader.dart';

void main() {
  const tUserModel = UserModel(email: "example@gmail.com", password: "12345");

  group("User Model", () {
    test('should be a subclass of User entity', () async {
      expect(tUserModel, isA<UserEntity>());
    });

    test("should return a valid JSON model", () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture("user.json"));

      // act

      final result = UserModel.fromJson(jsonMap);

      // assert

      expect(result, tUserModel);
    });

    test("should return proper toJson", () async {
      final result = tUserModel.toJson();
      final expectedMap = {"email": "example@gmail.com", "password": "12345"};
      expect(result, expectedMap);
    });
  });
}

// ignore_for_file: overridden_fields, annotate_overrides
import 'package:tdd/domain/entities/user_entities.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String email,
    required String password,
    String name = '',
  }) : super(email: email, password: password, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      email: json["email"] ?? '',
      password: json["password"] ?? '',
      name: json['name'] ?? '');

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
      email: entity.email, password: entity.password, name: entity.name);

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

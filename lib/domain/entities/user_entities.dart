import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String email;
  final String password;
  final String name;

  const UserEntity({
    required this.email,
    required this.password,
    this.name = '',
  });

//  factory UserEntity.toUserModel()

  @override
  List<Object?> get props => [email, password, name];

  @override
  bool get stringify => true;
}

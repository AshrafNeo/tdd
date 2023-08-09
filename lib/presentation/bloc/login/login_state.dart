// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

final class LoginState implements EquatableMixin {
  final String email;
  final String password;
  final FormSubmissionStatus formSubmissionStatus;

  const LoginState(
      {this.email = '',
      this.password = '',
      this.formSubmissionStatus = const InitialFormStatus()});

  LoginState copyWith(
      {String? email,
      String? password,
      FormSubmissionStatus? formSubmissionStatus}) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
      ];

  @override
  bool get stringify => true;
}

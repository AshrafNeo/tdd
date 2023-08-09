part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginSubmitted extends LoginEvent {
  final FormSubmissionStatus formSubmissionStatus;
  final String email;
  final String password;

  const LoginSubmitted({
    required this.email,
    required this.password,
    required this.formSubmissionStatus,
  });
  @override
  List<Object> get props => [formSubmissionStatus];
}

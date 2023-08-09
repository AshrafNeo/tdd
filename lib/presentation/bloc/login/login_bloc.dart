import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:tdd/domain/entities/entities.dart';
import 'package:tdd/domain/usecases/login_usecase.dart';
import 'package:tdd/utils/form_submission.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;

  LoginBloc({required this.loginUsecase}) : super(const LoginState()) {
    on<LoginSubmitted>(_formSubmitEvent);
  }

  void _formSubmitEvent(LoginSubmitted event, Emitter<LoginState> emit) async {
    try {
      emit(
        state.copyWith(
            email: event.email,
            password: event.password,
            formSubmissionStatus: event.formSubmissionStatus),
      );

      await loginUsecase(
        params: LoginParams(
          UserEntity(email: state.email, password: state.password),
        ),
      );
      emit(
        state.copyWith(
          formSubmissionStatus: SubmissionSuccess(),
        ),
      );
    } catch (e) {
      log("$e", name: "Exception");
      emit(
        state.copyWith(
          formSubmissionStatus: SubmissionFailed(e.toString()),
        ),
      );
    }
  }
}

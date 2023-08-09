import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:tdd/domain/usecases/login_usecase.dart';
import 'package:tdd/presentation/bloc/login/login_bloc.dart';
import 'package:tdd/utils/form_submission.dart';

// Update the import path to the correct location of the LoginBloc class.
import 'login_bloc_test.mocks.dart';

class MockLoginUsecase extends Mock implements LoginUsecase {}

@GenerateMocks([MockLoginUsecase])
void main() {
  late LoginBloc loginBloc;
  final MockMockLoginUsecase mockLoginUsecase = MockMockLoginUsecase();

  setUp(() {
    //  Bloc.observer = MyGlobalObserver();
    loginBloc = LoginBloc(loginUsecase: mockLoginUsecase);
  });

  tearDown(() {
    // Close the LoginBloc after each test
    loginBloc.close();
  });

  test("initial state", () {
    expect(loginBloc.state, const LoginState());
  });

  group("Test Login Events", () {
    blocTest<LoginBloc, LoginState>(
      'emits [Loading, SubmissionSuccess] when login is successful',
      build: () => loginBloc,
      act: (bloc) {
        bloc.add(
          LoginSubmitted(
            email: 'example@gmail.com',
            password: '12345',
            formSubmissionStatus: FormSubmitting(),
          ),
        );
      },
      expect: () => [
        isA<LoginState>()
            .having((state) => state.email, "email", 'example@gmail.com')
            .having((state) => state.password, "password", '12345'),
        isA<LoginState>()
            .having((state) => state.email, "email", 'example@gmail.com')
            .having((state) => state.password, "password", '12345'),
      ],
      // verify: (_) {
      //   verify(
      //     () => mockLoginUsecase.call(
      //       params: LoginParams(
      //         const UserEntity(email: "example@gmail.com", password: '12345'),
      //       ),
      //     ),
      //   ).called(1);
      // },
    );
  });
}

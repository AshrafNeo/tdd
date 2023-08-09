// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd/presentation/bloc/bloc.dart';

import 'package:tdd/utils/form_submission.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              // if (state.formSubmissionStatus is SubmissionSuccess) {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const HomePage(),
              //     ),
              //   );
              // }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.3),
                      TextField(
                        key: const Key('email'),
                        controller: _emailController,
                        decoration:
                            const InputDecoration(hintText: 'Enter email'),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      TextField(
                        key: const Key('password'),
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(hintText: 'Enter password'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState?.save();

                          if (_formKey.currentState!.validate()) {
                            context.read<LoginBloc>().add(
                                  LoginSubmitted(
                                    email: _emailController.text,
                                    password: _passwordController.text,
                                    formSubmissionStatus: FormSubmitting(),
                                  ),
                                );
                          } else {
                            print("FAILED");
                          }
                        },
                        child: state.formSubmissionStatus is FormSubmitting
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text("Login"),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

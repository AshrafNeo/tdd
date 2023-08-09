import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd/bloc_observer.dart';

import 'package:tdd/presentation/bloc/login/login_bloc.dart';
import 'package:tdd/presentation/pages/login.dart';

import 'firebase_options.dart';
import 'injection_container.dart' as di;

//import 'package:flutter_driver/driver_extension.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // enableFlutterDriverExtension();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyGlobalObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<LoginBloc>(
        create: (BuildContext context) => di.getItInstance<LoginBloc>(),
        child: const LoginPage(),
      ),
    );
  }
}




/**
 * 
 * 
1) login ui
2) bloc
3) clean 
4) unit testing of bloc and repository
5) widget testing
6) integration testing
 */
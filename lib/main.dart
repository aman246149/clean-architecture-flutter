import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/pages/signup_page.dart';
import 'package:ecommerce/features/homePage/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/features/homePage/presentation/pages/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) =>
          AuthBloc(loginUseCase: di.sl(), signupUseCase: di.sl()),
    ),
    BlocProvider(
      create: (context) => HomeBloc(usecase: di.sl())..add(FetchDataEvent()),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // if (!snapshot.hasData) {
            //   return const SignUp();
            // }

            // if (snapshot.connectionState == ConnectionState.waiting) {
            //   return const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }

            return HomePageq();
          }),
    );
  }
}

import 'package:ecommerce/core/categories/categories.dart';
import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/pages/signup_page.dart';
import 'package:ecommerce/features/homePage/presentation/bloc/home_bloc.dart';
import 'package:ecommerce/features/homePage/presentation/pages/homepage.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController econtroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              print(state.data);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageq()));
            }
          },
          builder: (context, state) {
            print(state);
            return Center(
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: econtroller,
                          decoration:
                              const InputDecoration(label: Text("email")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: pcontroller,
                          decoration:
                              const InputDecoration(label: Text("password")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: state is AuthError
                            ? Text(
                                state.errorMessage,
                                style: const TextStyle(color: Colors.red),
                              )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: state is AuthLoading == true
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () async {
                                  provider.add(AuthLoginEvent(
                                    email: econtroller.text,
                                    password: pcontroller.text,
                                  ));
                                },
                                child: const Text("Login")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Dont have an account ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignUp(),
                                    ));
                              },
                              child: const Text("Signup"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}

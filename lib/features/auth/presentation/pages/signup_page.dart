import 'package:ecommerce/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ecommerce/features/auth/presentation/pages/login_page.dart';
import 'package:ecommerce/features/homePage/presentation/pages/homepage.dart';


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController econtroller = TextEditingController();
  TextEditingController pcontroller = TextEditingController();
  TextEditingController ucontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("SignUp"),
          automaticallyImplyLeading: false,
        ),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              print(state.data);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>  HomePageq()));
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
                        child: TextField(
                          controller: ucontroller,
                          decoration:
                              const InputDecoration(label: Text("username")),
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
                                  provider.add(AuthSignUpEvent(
                                      email: econtroller.text,
                                      password: pcontroller.text,
                                      username: ucontroller.text));
                                },
                                child: const Text("SignUp")),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "already SignUp ",
                            style: TextStyle(fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LogIn(),
                                    ));
                              },
                              child: const Text("Login"))
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

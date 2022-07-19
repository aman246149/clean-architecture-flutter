part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String username;

  AuthSignUpEvent(
      {required this.email, required this.password, required this.username});
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({required this.email, required this.password});
}

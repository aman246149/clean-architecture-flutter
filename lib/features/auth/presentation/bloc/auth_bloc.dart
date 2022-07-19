import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce/features/auth/domain/usecases/signup_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  //! calling usecase here

  final SignupUseCase signupUseCase;
  final LoginUseCase loginUseCase;

  AuthBloc({required this.signupUseCase, required this.loginUseCase})
      : super(AuthInitial()) {
    on<AuthSignUpEvent>((event, emit) async {
      emit(AuthLoading());

      final response = await signupUseCase.signup(
          event.email, event.password, event.username);

      response.fold((left) async {
        emit(AuthError(errorMessage: left.message));
      }, (right) => emit(AuthSuccess(data: right.toString())));
    });

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoading());
      final response = await loginUseCase.login(event.email, event.password);

  
      response.fold((left) async {
        emit(AuthError(errorMessage: left.message));
      }, (right) => emit(AuthSuccess(data: right.toString())));
    });
  }
}

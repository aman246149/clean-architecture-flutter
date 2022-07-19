import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repositories/userRepository.dart';
import 'package:either_dart/either.dart';

class SignupUseCase {
  final UserRepository repository;

  SignupUseCase({required this.repository});

  Future<Either<CustomError, String>> signup(
      String email, String password, String username) async {
    print("usecase called");
    return await repository.signup(
        email: email, password: password, username: username);
  }
}

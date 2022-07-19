import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/auth/domain/repositories/userRepository.dart';
import 'package:either_dart/either.dart';

class LoginUseCase {
  final UserRepository repository;

  LoginUseCase({required this.repository});

  Future<Either<CustomError, String>> login(
      String email, String password) {
    return repository.login(email: email,password: password);
  }
 
}

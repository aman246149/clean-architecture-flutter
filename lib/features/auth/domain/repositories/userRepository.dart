import 'package:ecommerce/core/errors/customError.dart';
import 'package:either_dart/either.dart';

abstract class UserRepository {
  Future<Either<CustomError, String>> signup(
      {String email, String password, String username});
  Future<Either<CustomError, String>> login({String email, String password});
}

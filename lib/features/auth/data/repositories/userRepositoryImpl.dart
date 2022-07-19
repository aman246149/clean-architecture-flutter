import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/auth/data/datasources/networkDataSource.dart';
import 'package:ecommerce/features/auth/domain/repositories/userRepository.dart';
import 'package:either_dart/src/either.dart';

// ignore: camel_case_types
class userRepositoryImpl implements UserRepository {
  final NetworkDataSource networkDataSource;

  userRepositoryImpl({required this.networkDataSource});

  @override
  Future<Either<CustomError, String>> login(
      {String? email, String? password}) async {
    try {
      final response =
          await networkDataSource.login(email: email!, password: password!);
      return Right(response);
    } catch (err) {
      return Left(CustomError(message: err.toString()));
    }
  }

  @override
  Future<Either<CustomError, String>> signup(
      {String? email, String? password, String? username}) async {
    try {
      final response = await networkDataSource.signup(
          email: email!, password: password!, username: username!);
      return Right(response);
    } catch (err) {
      print(err);
      return Left(CustomError(message: err.toString()));
    }
  }
}

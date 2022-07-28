import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:either_dart/either.dart';

class TotalPrice {
  final CartRepository repository;

  TotalPrice({required this.repository});
  Future<Either<CustomError, double>> totalPrice() async {
    return await repository.totalPrice();
  }
}

import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:either_dart/either.dart';

class GetCartData {
  final CartRepository repository;

  GetCartData({required this.repository});

  Future<Either<CustomError, Map<String,dynamic>>> getCardData() async {
    return await repository.getCartData();
  }
}

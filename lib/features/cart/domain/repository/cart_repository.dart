import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';
import 'package:either_dart/either.dart';

abstract class CartRepository {
  Future<Either<CustomError, List<CartModel>>> getCartData();
  Future<Either<CustomError, List<CartModel>>> addCartData(CartModel data);
  Future<Either<CustomError, List<CartModel>>> deleteCartData(int index);
  Future<Either<CustomError, double>> totalPrice();

}

import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';
import 'package:either_dart/either.dart';

abstract class CartRepository {
  Future<Either<CustomError,Map<String,dynamic>>> getCartData();
  Future<Either<CustomError,Map<String,dynamic>>> addCartData(CartModel data);
  Future<Either<CustomError,Map<String,dynamic>>> deleteCartData(int index);


}

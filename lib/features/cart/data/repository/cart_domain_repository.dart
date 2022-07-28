import 'package:ecommerce/features/cart/data/datasources/cart_datasource.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';
import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:either_dart/src/either.dart';

class CartDomainRepository implements CartRepository {
  final CartDataSource cartDataSource;

  CartDomainRepository({required this.cartDataSource});

  @override
  Future<Either<CustomError, List<CartModel>>> addCartData(
      CartModel data) async {
    try {
      return Right(await cartDataSource.addDataToCart(data));
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, List<CartModel>>> deleteCartData(int index) async {
    try {
      return Right(await cartDataSource.deleteDataToCart(index));
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }

  @override
  Future<Either<CustomError, List<CartModel>>> getCartData() async {
    try {
      return Right(await cartDataSource.getDataToCart());
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }
  
  @override
  Future<Either<CustomError, double>> totalPrice() async{
    try {
      return Right(await cartDataSource.totalprice());
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }
}

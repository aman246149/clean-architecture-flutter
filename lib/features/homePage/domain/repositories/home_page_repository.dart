import 'package:ecommerce/core/errors/customError.dart';
import 'package:ecommerce/features/homePage/domain/entities/product_model.dart';
import 'package:either_dart/either.dart';

abstract class HomePageRepository {
  Future<Either<CustomError, List<productModel>>> fetchProduct(documentname);
}

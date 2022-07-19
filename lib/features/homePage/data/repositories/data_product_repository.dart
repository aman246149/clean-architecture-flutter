import 'package:either_dart/src/either.dart';

import 'package:ecommerce/features/homePage/domain/entities/product_model.dart';

import 'package:ecommerce/core/errors/customError.dart';

import '../../domain/repositories/home_page_repository.dart';
import '../datasources/productfetchonline.dart';

class DataProductRepositoryImpl extends HomePageRepository {
  final FetchData fetchData;

  DataProductRepositoryImpl({required this.fetchData});

  @override
  Future<Either<CustomError, List<productModel>>> fetchProduct() async {
    try {
      final listOfProducts = await fetchData.fetchOnlineProducts();
      return Right(listOfProducts);
    } catch (e) {
      return Left(CustomError(message: e.toString()));
    }
  }
}

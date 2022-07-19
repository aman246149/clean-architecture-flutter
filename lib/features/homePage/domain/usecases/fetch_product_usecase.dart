import 'package:ecommerce/features/homePage/data/models/productModel.dart';
import 'package:ecommerce/features/homePage/domain/entities/product_model.dart';
import 'package:ecommerce/features/homePage/domain/repositories/home_page_repository.dart';
import 'package:either_dart/either.dart';

import '../../../../core/errors/customError.dart';

class FetchProductsOnlineUsecase {
  final HomePageRepository repository;

  FetchProductsOnlineUsecase({required this.repository});

  Future<Either<CustomError, List<productModel>>>
      fetchProductUsecaseMethod() async {
    return await repository.fetchProduct();
  }
}

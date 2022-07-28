import 'package:ecommerce/features/cart/data/models/cart_data_model.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';

abstract class CartDataSource {
  Future<List<CartModel>> addDataToCart(CartModel data);
  Future<List<CartModel>> deleteDataToCart(int index);
  Future<List<CartModel>> getDataToCart();
  Future<double> totalprice();
}

class CartDataSourceImpl implements CartDataSource {
  List<CartModel> cartList = [];
  @override
  Future<List<CartModel>> addDataToCart(CartModel data) {
    cartList.add(data);
    return Future.value(cartList);
  }

  @override
  Future<List<CartModel>> deleteDataToCart(int index) {
    cartList.removeAt(index);
    return Future.value(cartList);
  }

  @override
  Future<List<CartModel>> getDataToCart() {
    return Future.value(cartList);
  }

  @override
  Future<double> totalprice() {
    double price = 0.0;
    for (var element in cartList) {
      price += element.price;
    }

    return Future.value(price);
  }
}

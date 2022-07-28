import 'package:ecommerce/features/cart/data/models/cart_data_model.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';

abstract class CartDataSource {
  Future<Map<String, dynamic>> addDataToCart(CartModel data);
  Future<Map<String, dynamic>> deleteDataToCart(int index);
  Future<Map<String, dynamic>> getDataToCart();
}

class CartDataSourceImpl implements CartDataSource {
  List<CartModel> cartList = [];

  @override
  Future<Map<String, dynamic>> addDataToCart(CartModel data) {
    cartList.add(data);
    double totalPrice = 0.0;
    totalPrice = totalmoney();
    print("^^^^^^");
    print(data.title);
    return Future.value({"cartList": cartList, "totalprice": totalPrice});
  }

  @override
  Future<Map<String, dynamic>> deleteDataToCart(int index) {
    cartList.removeAt(index);
    double totalPrice = 0.0;
    totalPrice = totalmoney();
    return Future.value({"cartList": cartList, "totalprice": totalPrice});
  }

  @override
  Future<Map<String, dynamic>> getDataToCart() {
    double totalPrice = 0.0;
    totalPrice = totalmoney();
    return Future.value({"cartList": cartList, "totalprice": totalPrice});
  }

  double totalmoney() {
    double price = 0.0;
    for (var element in cartList) {
      price += element.price;
    }

    return price;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/homePage/domain/entities/product_model.dart';

class ProductModelData extends productModel {
  ProductModelData(
      {required super.productPrice,
      required super.productName,
      required super.productId,
      required super.productDateAdded,
      required super.productImageUrl
      });

  factory ProductModelData.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> map) {
    return ProductModelData(
        productPrice: map["productPrice"],
        productName: map["productName"],
        productId: map["productId"],
        productDateAdded: map["productDateAdded"],
        productImageUrl:map["productImageUrl"]
        );
  }

  Map<String, dynamic> tojson() {
    return {
      "productPrice": productPrice,
      "productName": productName,
      "productId": productId,
      "productDateAdded": productDateAdded,
      "productImageUrl":productImageUrl
    };
  }
}

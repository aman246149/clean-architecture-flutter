import 'package:cloud_firestore/cloud_firestore.dart';

class productModel {
  final double productPrice;
  final String productName;
  final String productId;
  final Timestamp productDateAdded;
  final String productImageUrl;

  productModel( 
      {required this.productPrice,
      required this.productName,
      required this.productId,
      required this.productDateAdded,
      required this.productImageUrl
      });
}

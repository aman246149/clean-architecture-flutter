import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/homePage/data/models/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FetchData {
  Future<List<ProductModelData>> fetchOnlineProducts();
}

class FetchDataImpl implements FetchData {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FetchDataImpl({required this.firestore, required this.auth});
  @override
  Future<List<ProductModelData>> fetchOnlineProducts() async {
    try {
      final productList = await firestore.collection("products").get();
      if (productList.docs.isEmpty) {
        throw "no product available";
      } else {
        List<ProductModelData> localList = [];
        for (var element in productList.docs) {
          ProductModelData productModelData = ProductModelData.fromMap(element);
          localList.add(productModelData);
        }
        return localList;
      }
    } catch (e) {
      rethrow;
    }
  }
}

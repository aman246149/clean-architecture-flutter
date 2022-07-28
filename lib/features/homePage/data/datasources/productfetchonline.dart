import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/homePage/data/models/productModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FetchData {
  Future<List<ProductModelData>> fetchOnlineProducts(String documentname);
}

class FetchDataImpl implements FetchData {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  FetchDataImpl({required this.firestore, required this.auth});
  @override
  Future<List<ProductModelData>> fetchOnlineProducts(String documentname) async {
    try {
      final productList = await firestore
          .collection("products")
          .doc(documentname)
          .collection(documentname)
          .get();
      if (productList.docs.isEmpty) {
        throw "no product available";
      } else {
        List<ProductModelData> localList = [];
        print(productList.docs);
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

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:ecommerce/features/auth/data/models/userDataSourceModel..dart';

import 'package:firebase_auth/firebase_auth.dart';

abstract class NetworkDataSource {
  Future<String> signup({String email, String password, String username});
  Future<String> login({String email, String password});
}

class NetworksDataSourceImpl implements NetworkDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  NetworksDataSourceImpl({required this.auth, required this.firestore});
  @override
  Future<String> login({String? email, String? password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email!, password: password!);
      return "success";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> signup(
      {String? email, String? password, String? username}) async {


    userDataSourceModel user = userDataSourceModel(
        email: email!, password: password!, username: username!);

    var data = user.toMap();

    try {
      UserCredential user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      await firestore.collection("users").doc(user.user!.uid).set(data);

      print(user.user.toString());

      return "success";
    } catch (e) {
      rethrow;
    }
  }
}

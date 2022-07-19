import '../../domain/entities/user.dart';

// ignore: camel_case_types
class userDataSourceModel extends User {
  userDataSourceModel(
      {required super.email, required super.password, required super.username});

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
      "username": username
    };
  }
}

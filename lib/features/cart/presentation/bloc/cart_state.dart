part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartErrorState extends CartState {
  final String errorMsg;

  CartErrorState({required this.errorMsg});
}

class CartSuccessState extends CartState {
  final Map<String,dynamic> cartList;

  CartSuccessState({required this.cartList});
}



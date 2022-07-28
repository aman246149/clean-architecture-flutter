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
  final List<CartModel> cartList;

  CartSuccessState({required this.cartList});
}

class CartTotalPrice extends CartState {
  final double totalPrice;

  CartTotalPrice({required this.totalPrice});

}

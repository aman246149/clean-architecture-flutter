part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddCartEvent implements CartEvent {
 final CartModel data;

  AddCartEvent({required this.data});
}

class DeleteCartEvent implements CartEvent {
 final int index;

  DeleteCartEvent({required this.index});
}


class GetCartEvent implements CartEvent {
}

class GetTotalPrice implements CartEvent{
  
}

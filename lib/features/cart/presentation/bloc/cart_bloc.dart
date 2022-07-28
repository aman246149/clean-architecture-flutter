import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/cart/domain/entity/cart_model.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;
  CartBloc({required this.repository}) : super(CartInitial()) {
    on<CartEvent>((event, emit) {});

    on<AddCartEvent>((event, emit) async {
      emit(CartLoadingState());
      final res = await repository.addCartData(event.data);
      res.fold((left) => emit(CartErrorState(errorMsg: left.message)),
          (right) => emit(CartSuccessState(cartList: right)));
    });

    on<DeleteCartEvent>((event, emit) async {
      emit(CartLoadingState());
      final res = await repository.deleteCartData(event.index);
      res.fold((left) => emit(CartErrorState(errorMsg: left.message)),
          (right) => emit(CartSuccessState(cartList: right)));
    });

    on<GetCartEvent>((event, emit) async {
      emit(CartLoadingState());
      final res = await repository.getCartData();
      res.fold((left) => emit(CartErrorState(errorMsg: left.message)),
          (right) => emit(CartSuccessState(cartList: right)));
    });

    on<GetTotalPrice>((event, emit) async {
      final res = await repository.totalPrice();
      res.fold((left) => emit(CartErrorState(errorMsg: left.message)),
          (right) => emit(CartTotalPrice(totalPrice: right)));
    });
  }
}

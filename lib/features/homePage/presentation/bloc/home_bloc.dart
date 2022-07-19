import 'package:bloc/bloc.dart';
import 'package:ecommerce/features/homePage/domain/entities/product_model.dart';
import 'package:ecommerce/features/homePage/domain/usecases/fetch_product_usecase.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchProductsOnlineUsecase usecase;

  HomeBloc({required this.usecase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
    });

    on<FetchDataEvent>((event, emit) async {
      emit(HomeLoadingState());
      final response = await usecase.fetchProductUsecaseMethod();

      response.fold((left) {
        emit(HomeErrorState(error: left.message));
      }, (right) => emit(HomeSuccessState(products: right)));
    });
  }
}

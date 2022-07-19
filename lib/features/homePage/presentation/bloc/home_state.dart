part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState({required this.error});
}

class HomeSuccessState extends HomeState {
  final List<productModel> products;

  HomeSuccessState({required this.products});
}

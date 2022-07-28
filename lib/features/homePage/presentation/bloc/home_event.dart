part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class FetchDataEvent extends HomeEvent {
  final String documentname;

  FetchDataEvent({required this.documentname});
}

class ChangeState extends HomeEvent {
  final int index;

  ChangeState(this.index);
}

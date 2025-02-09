import 'package:ecommerce_app/model/api_home.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeStateSuccessful extends HomeState {
  final HomeModel user;
  HomeStateSuccessful(this.user);
}

class HomeStateError extends HomeState {
  final String errorMessage;
  HomeStateError({required this.errorMessage});
}

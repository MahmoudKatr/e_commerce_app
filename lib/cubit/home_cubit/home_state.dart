import 'package:ecommerce_app/model/api_home.dart';

abstract class HomeState {}

class HomeStateInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeStateSuccessful extends HomeState {
  final HomeModel homeModel; // ✅ Make sure this is defined correctly
  HomeStateSuccessful(this.homeModel);
}

class HomeStateError extends HomeState {
  final String errorMessage;
  HomeStateError({required this.errorMessage});
}

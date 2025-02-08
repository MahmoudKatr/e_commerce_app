part of 'register_cubit.dart';

@immutable
sealed class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

class SignUpSuccessful extends RegisterCubitState {
  final UserModel user;
  SignUpSuccessful(this.user);
}

class SignUpFailure extends RegisterCubitState {
  final String error;
  SignUpFailure(this.error);
}

class SignUpLoading extends RegisterCubitState {}

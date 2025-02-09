part of 'login_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class SignInSuccessful extends LoginCubitInitial {
  final UserData user;
  SignInSuccessful(this.user);
}

class SignInFailure extends LoginCubitInitial {
  final String error;
  SignInFailure(this.error);
}

class SignUpLoading extends LoginCubitInitial {}

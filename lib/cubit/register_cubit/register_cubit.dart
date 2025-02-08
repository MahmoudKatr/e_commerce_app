import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/model/api_register.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(RegisterCubitInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  void userRegister(
      {required String name,
      String? phone,
      required String email,
      required String password}) async {
    emit(SignUpLoading());
    try {
      var response = await Dio().post(
        ApiConstants.register,
        data: {
          'name': name,
          'phone': '01117871340',
          'email': email,
          'password': password,
          "image":
              "https://img.freepik.com/free-vector/isolated-young-handsome-man-different-poses-white-background-illustration_632498-859.jpg?t=st=1738695804~exp=1738699404~hmac=907da3722d5a50129709e327874a9e25e784f10b19c6f544ba059af56bca6118&w=1060",
        },
      );
      UserModel userModel = UserModel.fromJson(response.data);
      emit(SignUpSuccessful(userModel));
    } catch (e) {
      SignUpFailure(e.toString());
    }
  }
}

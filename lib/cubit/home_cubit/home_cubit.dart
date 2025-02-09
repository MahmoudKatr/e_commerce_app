import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_state.dart';
import 'package:ecommerce_app/model/api_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  void getHomeDaata() async {
    try {
      Response HomeResponse = await Dio().get(ApiConstants.home);
      homeModel = HomeModel.fromJson(HomeResponse.data);
    } on Exception {
      emit(HomeStateError(
          errorMessage: 'An error occurred while fetching data'));
    }
  }
}

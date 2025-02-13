import 'package:dio/dio.dart';
import 'package:ecommerce_app/constant/constant.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_state.dart';
import 'package:ecommerce_app/model/api_categories.dart';
import 'package:ecommerce_app/model/api_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeStateInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  HomeModel? homeModel;
  CategoriesModel2? categoriesModel;
  void getHomeData() async {
    try {
      emit(HomeLoading());

      Response homeResponse = await Dio().get(ApiConstants.home);
      Response categoriesResponse = await Dio().get(ApiConstants.categories);
      if (homeResponse.statusCode == 200 || homeResponse.statusCode == 201) {
        homeModel = HomeModel.fromJson(homeResponse.data);
        categoriesModel = CategoriesModel2.fromJson(categoriesResponse.data);

        emit(HomeStateSuccessful(homeModel!, categoriesModel!));
      }
    } on DioException catch (error) {
      if (error.response != null) {
        if (error.response!.statusCode == 400) {
          emit(HomeStateError(
              errorMessage: "Invalid login credentials. Try again."));
        } else if (error.response!.statusCode == 404) {
          emit(HomeStateError(
              errorMessage: "Server not found. Try again later."));
        } else if (error.response!.statusCode == 500) {
          emit(HomeStateError(
              errorMessage: "Server error. Please try again later."));
        } else {
          emit(HomeStateError(
              errorMessage: "Error: ${error.response!.statusCode}"));
        }
      } else {
        emit(HomeStateError(
            errorMessage: "Network error. Check your connection."));
      }
    }
  }
}

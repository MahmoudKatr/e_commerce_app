import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/components/custom_appbar.dart';
import 'package:ecommerce_app/components/custom_carsousel_slider.dart';
import 'package:ecommerce_app/components/custom_category_body.dart';
import 'package:ecommerce_app/components/custom_flash_scale_body.dart';
import 'package:ecommerce_app/components/custom_mega_scale_body.dart';
import 'package:ecommerce_app/components/custom_recomended_body.dart';
import 'package:ecommerce_app/components/custom_row_text_button.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    HomeCubit.get(context).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const SizedBox(height: 6),
            Divider(color: Colors.grey[350], thickness: 1),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: BlocBuilder<HomeCubit, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is HomeStateSuccessful) {
                        // ✅ Extract banner images safely
                        List<String> bannerImages = state
                                .homeModel.data?.banners
                                ?.map((b) => b.image ?? "")
                                .toList() ??
                            [];
                        return Column(
                          children: [
                            const SizedBox(height: 16),
                            CustomCarouselSlider(
                              images:
                                  bannerImages, // ✅ Pass API images to slider
                            ),
                            const SizedBox(height: 16),
                            const CustomRowTextButton(
                              firstText: 'Category',
                              secondText: 'More Category',
                            ),
                            const SizedBox(height: 16),
                            CustomCategoryBody(),
                            const CustomRowTextButton(
                                firstText: 'Flash Sale',
                                secondText: 'See More'),
                            const FlashSaleList(),
                            const SizedBox(height: 16),
                            const CustomRowTextButton(
                              firstText: 'Mega Sale',
                              secondText: 'See More',
                            ),
                            const MegaSaleList(),
                            const SizedBox(height: 16),
                            const CustomRecomendedBody()
                          ],
                        );
                      } else {
                        return Center(child: Text("Failed to load data"));
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

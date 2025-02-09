import 'package:ecommerce_app/components/custom_appbar.dart';
import 'package:ecommerce_app/components/custom_carsousel_slider.dart';
import 'package:ecommerce_app/components/custom_category_body.dart';
import 'package:ecommerce_app/components/custom_flash_scale_body.dart';
import 'package:ecommerce_app/components/custom_row_text_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      const CustomCarouselSlider(
                        images: [
                          'https://www.pngplay.com/wp-content/uploads/6/E-Commerce-Icon-PNG-HD-Quality.png',
                          'https://static.vecteezy.com/system/resources/thumbnails/010/974/057/small_2x/online-shopping-3d-illustration-shopping-online-store-for-sale-mobile-e-commerce-3d-background-buying-and-selling-concept-png.png',
                          'https://static.vecteezy.com/system/resources/thumbnails/011/153/677/small/buy-button-e-commerce-3d-illustrations-png.png',
                        ],
                      ),
                      const SizedBox(height: 16),
                      const CustomRowTextButton(
                        firstText: 'Category',
                        secondText: 'More Category',
                      ),
                      const SizedBox(height: 16),
                      CustomCategoryBody(),
                      const CustomRowTextButton(
                          firstText: 'Flash Sale', secondText: 'See More'),
                      const FlashSaleList()
                    ],
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

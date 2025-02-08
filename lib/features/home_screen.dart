import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/components/custom_appbar.dart';
import 'package:ecommerce_app/components/custom_carsousel_slider.dart';
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
        child: Padding(
          padding: const EdgeInsets.only(top: 24, left: 8, right: 8),
          child: Column(
            children: [
              const CustomAppBar(),
              const SizedBox(
                height: 6,
              ),
              Divider(
                color: Colors.grey[350],
                thickness: 1,
              ),
              const CustomCarouselSlider(
                images: [
                  'https://www.pngplay.com/wp-content/uploads/6/E-Commerce-Icon-PNG-HD-Quality.png',
                  'https://static.vecteezy.com/system/resources/thumbnails/010/974/057/small_2x/online-shopping-3d-illustration-shopping-online-store-for-sale-mobile-e-commerce-3d-background-buying-and-selling-concept-png.png',
                  'https://static.vecteezy.com/system/resources/thumbnails/011/153/677/small/buy-button-e-commerce-3d-illustrations-png.png',
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

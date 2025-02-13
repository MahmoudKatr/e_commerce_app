import 'package:dio/io.dart';
import 'package:ecommerce_app/features/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_cubit.dart';
import 'package:ecommerce_app/cubit/home_cubit/home_state.dart';
import 'package:ecommerce_app/model/api_categories.dart';

class CustomCategoryBody extends StatelessWidget {
  const CustomCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeStateSuccessful) {
            List<CategoryModel> categories = state.categoriesModel.categories;
            if (categories.isEmpty) {
              return const Center(child: Text("No categories available"));
            }
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return _buildCategoryItem(
                    imageUrl: categories[index].image,
                    label: categories[index].name,
                    onTap: () {
                      // Navigate to the product list screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductScreen(id: categories[index].id)));
                    });
              },
            );
          } else if (state is HomeStateError) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }

  Widget _buildCategoryItem(
      {required String imageUrl, required String label, required onTap}) {
    final Function()? OnTap;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45),
              child: Container(
                width: 85,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(45),
                ),
                child: Image.network(imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

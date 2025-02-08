import 'package:ecommerce_app/components/custom_appbar.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}

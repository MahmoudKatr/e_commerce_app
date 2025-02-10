import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/features/authentication/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                text: 'LogOut',
                onPressed: () async {
                  SharedPreferences pres =
                      await SharedPreferences.getInstance();
                  await pres.remove('user_token');

                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                })
          ],
        ),
      ),
    );
  }
}

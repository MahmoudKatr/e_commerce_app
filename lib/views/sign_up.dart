import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_row.dart';
import 'package:ecommerce_app/components/custom_text_field.dart';
import 'package:ecommerce_app/views/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  'https://trangotech.com/blog/wp-content/uploads/2024/05/ecommerce-app-features.jpg'),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              "Let's Get Started",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff272f54),
              ),
            ),
            const Text(
              'Create an new account',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xff9f9da8),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              controller: fullnameController,
              hintText: 'Full Name',
              prefix: Icons.person,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              controller: fullnameController,
              hintText: 'Your Email',
              prefix: Icons.email,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              controller: fullnameController,
              hintText: 'Password',
              prefix: Icons.work,
            ),
            const SizedBox(
              height: 12,
            ),
            CustomTextFormField(
              controller: fullnameController,
              hintText: 'Password',
              prefix: Icons.lock,
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomButton(
              text: 'Sign Up',
            ),
            const SizedBox(
              height: 12,
            ),
            CustomRow(
              text: 'Do you have an Account?',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()));
              },
              textButton: 'Sign In',
            )
          ],
        ),
      ),
    );
  }
}

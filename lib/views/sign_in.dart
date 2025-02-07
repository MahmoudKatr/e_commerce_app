import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_divider.dart';
import 'package:ecommerce_app/components/custom_row.dart';
import 'package:ecommerce_app/components/custom_text_button.dart';
import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:ecommerce_app/components/social_login_button.dart';
import 'package:ecommerce_app/views/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email address.';
                    }
                    if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                  controller: emailController,
                  hintText: 'Your Email',
                  prefix: Icons.email,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomTextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter a password.';
                    }
                    return null;
                  },
                  controller: passwordController,
                  hintText: 'Password',
                  prefix: Icons.lock,
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomButton(
                  text: 'Sign In',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 12,
                ),
                const CustomDivider(titleDivider: 'OR'),
                const SizedBox(height: 16),
                SocialLoginButton(
                  icon: FontAwesomeIcons.google,
                  text: "Login with Google",
                  onPressed: () {},
                ),
                const SizedBox(height: 12),
                SocialLoginButton(
                  icon: FontAwesomeIcons.facebook,
                  text: "Login with Facebook",
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextButton(
                  text: 'Forgot Password',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 4,
                ),
                CustomRow(
                  text: "Don't have an account?",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  textButton: 'Register',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

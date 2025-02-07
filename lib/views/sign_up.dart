import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_row.dart';
import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:ecommerce_app/views/sign_in.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordCheckController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 120, left: 20, right: 20),
        child: SingleChildScrollView(
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
                    return 'Please enter your full name.';
                  }
                  return null;
                },
                controller: fullnameController,
                hintText: 'Full Name',
                prefix: Icons.person,
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
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters long.';
                  }
                  if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$')
                      .hasMatch(value)) {
                    return 'Password must contain at least one uppercase letter, one lowercase letter, one number, and one special character.';
                  }
                  if (passwordController.text != passwordCheckController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
                controller: passwordController,
                hintText: 'Password',
                prefix: Icons.work,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please confirm your password.';
                  }
                  if (passwordController.text != passwordCheckController.text) {
                    return 'Passwords do not match.';
                  }
                  return null;
                },
                controller: passwordCheckController,
                hintText: 'Password',
                prefix: Icons.lock,
              ),
              const SizedBox(
                height: 12,
              ),
              CustomButton(
                text: 'Sign Up',
                onPressed: () {},
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
      ),
    );
  }
}

import 'package:ecommerce_app/components/custom_button.dart';
import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_app/cubit/profile_cubit/profile_cubit.dart';
import 'package:ecommerce_app/cubit/profile_cubit/profile_state.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  void initState() {
    super.initState();
    ProfileCubit.get(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Profile'),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 100.0,
                      backgroundColor: Colors.grey.shade200,
                      child: ClipOval(
                        child: Image.network(
                          state.profileModel.data!.image,
                          fit: BoxFit.cover,
                          width: 200.0,
                          height: 200.0,
                        ),
                      )),
                  const SizedBox(height: 50),
                  CustomTextFormField(
                    isEnabled: true,
                    prefix: Icons.person,
                    prefixIconColor: Colors.grey.shade400,
                    hintText: state.profileModel.data!.name,
                  ),
                  const SizedBox(height: 25),
                  CustomTextFormField(
                    isEnabled: true,
                    prefix: Icons.email,
                    prefixIconColor: Colors.grey.shade400,
                    hintText: state.profileModel.data!.email,
                  ),
                  const SizedBox(height: 25),
                  CustomTextFormField(
                    isEnabled: false,
                    prefix: Icons.person,
                    prefixIconColor: Colors.grey.shade400,
                    hintText: state.profileModel.data!.phone,
                  ),
                  const SizedBox(height: 25),
                  CustomButton(text: 'Save Changed', onPressed: () {})
                  // Add more profile details here if needed
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
          return const Center(child: Text("Unexpected state"));
        },
      ),
    );
  }
}

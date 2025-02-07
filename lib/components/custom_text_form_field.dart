import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final IconData? prefix;
  final bool isPassword;
  final Widget? suffixIcon;
  final TextEditingController controller;

  const CustomTextFormField(
      {super.key,
      required this.controller,
      this.hintText,
      this.isPassword = false,
      this.label,
      this.onChanged,
      this.prefix,
      this.validator,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        validator: validator,
        onChanged: onChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(2),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade700),
            borderRadius: BorderRadius.circular(2),
          ),
          prefixIcon: prefix != null ? Icon(prefix) : null,
          suffixIcon: suffixIcon,
          prefixIconColor: Colors.grey[400],
          suffixIconColor: Colors.grey[400],
          hintText: hintText,
          labelText: label,
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

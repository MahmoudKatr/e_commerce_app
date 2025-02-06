import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({
    super.key,
    required this.text,
    required this.onPressed,
    required this.textButton,
  });
  final String text;
  final void Function()? onPressed;
  final String textButton;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets
                  .zero), // Remove extra padding  // This Part CHAT GPT
              minimumSize:
                  MaterialStateProperty.all(Size(0, 0)), // Ensure compact size
            ),
            child: Text(
              textButton,
              style: const TextStyle(color: Color(0xFF4591cb)),
            ))
      ],
    );
  }
}

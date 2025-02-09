import 'package:ecommerce_app/components/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomTextFormField(
              hintText: 'Search Product',
              prefix: Icons.search,
              prefixIconColor: Colors.blue,
            ),
          ),
          IconButton(
              icon: const Icon(
                Icons.favorite_border_outlined,
                color: Colors.grey,
              ),
              onPressed: () {}),
          Stack(
            children: [
              IconButton(
                  icon: const Icon(
                    Icons.notifications_none_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {}),
              Positioned(
                right: 12,
                top: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

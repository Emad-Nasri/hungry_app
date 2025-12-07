import 'package:flutter/material.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('assets/detail/Sandwich_details.png', height: 250),
              Spacer(),
              CustomText(
                text:
                    'Customize Your Burger\n to Your Tastes.\n Ultimate Experience',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

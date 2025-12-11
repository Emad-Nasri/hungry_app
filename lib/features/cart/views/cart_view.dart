import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Gap(100),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/detail/tomatow.png', width: 100),
                        CustomText(text: 'Tomatow', weight: FontWeight.bold),
                        CustomText(text: 'its color is red'),
                      ],
                    ),
                    Column(children: [
                        
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

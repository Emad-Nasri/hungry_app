import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry_app/features/cart/widgets/cart_item.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 120, top: 100),
          itemCount: 6,
          itemBuilder: (context, index) {
            return CartItem(
              image: 'assets/detail/tomatow.png',
              text: 'Tomatow',
              desc: 'its color is red',
              number: 1,
            );
          },
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        height: 100,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Total', size: 16),
                CustomText(text: '\$18.9', size: 24),
              ],
            ),
            CustomButton(text: 'Checkout', onTap: () {}),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Order summary',
              size: 20,
              weight: FontWeight.w500,
            ),
            Gap(10),
            checkoutWidget('Order', '18.5'),
            Gap(10),
            checkoutWidget('Taxes', '3.5'),
            Gap(10),
            checkoutWidget('Delivery fees', '2.4'),
            Gap(10),
          ],
        ),
      ),
    );
  }
}

Widget checkoutWidget(title, price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(
        text: title,
        size: 15,
        weight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
      CustomText(
        text: '$price\$',
        size: 15,
        weight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
    ],
  );
}

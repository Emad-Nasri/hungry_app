import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';
import 'package:hungry_app/features/product/widgets/topping_card.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double value = 0.5;
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicySlider(
              value: value,
              onChanged: (v) => setState(() => value = v),
            ),
            Gap(50),
            CustomText(text: 'Toppings', size: 20, weight: FontWeight.bold),
            Gap(70),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ToppingCard(
                      imageUrl: 'assets/detail/tomatow.png',
                      title: 'tomatow',
                      onAdd: () {},
                    ),
                  );
                }),
              ),
            ),
            Gap(20),
            CustomText(text: 'Side Options', size: 20, weight: FontWeight.bold),
            Gap(70),
            SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ToppingCard(
                      imageUrl: 'assets/detail/tomatow.png',
                      title: 'tomatow',
                      onAdd: () {},
                    ),
                  );
                }),
              ),
            ),
            Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Total', size: 20),
                    CustomText(text: '\$18.9', size: 27),
                  ],
                ),
                CustomButton(text: 'Add To Cart', onTap: () {}),
              ],
            ),
            Gap(100),
          ],
        ),
      ),
    );
  }
}

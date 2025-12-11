import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/detail/tomatow.png', width: 100),
                        CustomText(text: 'Tomatow', weight: FontWeight.bold),
                        CustomText(text: 'its color is red'),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  CupertinoIcons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Gap(20),
                            CustomText(
                              text: '1',
                              weight: FontWeight.w400,
                              size: 20,
                            ),
                            Gap(20),
                            GestureDetector(
                              onTap: () {},
                              child: CircleAvatar(
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  CupertinoIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Gap(20),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          width: 130,
                          height: 45,
                          child: Center(
                            child: CustomText(
                              text: 'Remove',
                              color: Colors.white,
                            ),
                          ),
                        ),
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

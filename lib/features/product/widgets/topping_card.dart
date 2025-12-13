import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';

class ToppingCard extends StatelessWidget {
  const ToppingCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onAdd,
  });
  final String imageUrl;
  final String title;
  final VoidCallback onAdd;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(height: 90, width: 90, color: AppColors.primary),
        ),
        //image section
        Positioned(
          top: -40,
          right: -1,
          left: -1,
          child: SizedBox(
            height: 70,
            child: Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              child: Image.asset(imageUrl, fit: BoxFit.contain),
            ),
          ),
        ),
        //bottom widget
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Padding(
            padding: EdgeInsetsGeometry.all(12),
            child: Column(
              children: [
                CustomText(
                  text: title,
                  color: Colors.white,
                  size: 15,
                  weight: FontWeight.w600,
                ),
                Gap(10),
                GestureDetector(
                  onTap: onAdd,
                  child: CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.add, color: Colors.white, size: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

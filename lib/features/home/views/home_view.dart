import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/shared/custom_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['All', 'Combo', 'Siders', 'Classic'];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Gap(75),
                //header
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          'assets/logo/logo.svg',
                          color: AppColors.primary,
                          height: 35,
                        ),
                        Gap(5),
                        CustomText(
                          text: 'Hello, Emad Nasri',
                          size: 16,
                          weight: FontWeight.w500,
                          color: Colors.grey.shade500,
                        ),
                      ],
                    ),
                    Spacer(),
                    CircleAvatar(radius: 32),
                  ],
                ),

                Gap(25),
                //search
                Material(
                  elevation: 2,
                  shadowColor: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(CupertinoIcons.search),
                      hintText: 'Search...',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Gap(25),
                //category
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(category.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: selectedIndex == index
                                ? AppColors.primary
                                : Color(0xffF3F4F6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 27,
                            vertical: 15,
                          ),
                          child: CustomText(
                            text: category[index],
                            weight: FontWeight.w600,
                            color: selectedIndex == index
                                ? Colors.white
                                : Colors.grey.shade700,
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                //Card item
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.71,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) {
                    return CardItem(
                      image: 'assets/splash/splash.png',
                      text: 'Cheeseburger',
                      desc: 'Wendy\'s Burger',
                      rate: '4.9',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

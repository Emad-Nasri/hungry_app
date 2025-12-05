import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';
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
        body: CustomScrollView(
          //بيشبه الكولوم بس اقوى منو
          slivers: [
            //appbar
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Gap(75),
                    //header
                    UserHeader(),
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
                  ],
                ),
              ),
            ),
            //Grid View
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                delegate: SliverChildBuilderDelegate(
                  childCount: 6,
                  (context, index) => CardItem(
                    image: 'assets/splash/splash.png',
                    text: 'Cheese burger',
                    desc: 'Wedy\'s best buger',
                    rate: '4.9',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

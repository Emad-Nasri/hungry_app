import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/home/widgets/card_item.dart';
import 'package:hungry_app/features/home/widgets/food_category.dart';
import 'package:hungry_app/features/home/widgets/search_field.dart';
import 'package:hungry_app/features/home/widgets/user_header.dart';

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
                    SearchField(),
                    Gap(25),
                    //category
                    FoodCategory(
                      selectedIndex: selectedIndex,
                      category: category,
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              child: Row(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/detail/tomatow.png', width: 100),
                    ],
                  ),
                  Column(children: [
        
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

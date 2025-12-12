import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/features/checkout/widgets/order_details_widget.dart';
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
            OrderDetailsWidget(
              order: '18.5',
              taxes: '10.6',
              fees: '2.4',
              total: '100.4',
            ),
            Gap(80),
            CustomText(
              text: 'Payment methods',
              size: 20,
              weight: FontWeight.w500,
            ),
            Gap(20),
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              tileColor: Color(0xff3C2F2F),
              leading: Image.asset('assets/icon/cash.png', width: 50),
              title: CustomText(text: 'Cash on Delivery', color: Colors.white),
              trailing: Radio<String>(
                activeColor: Colors.white,
                value: 'Cash',
                groupValue: 'Cash',
                onChanged: (v) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

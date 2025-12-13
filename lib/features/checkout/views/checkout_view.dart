import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/checkout/widgets/order_details_widget.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String selectedMethod = 'Cash';

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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              //cash
              ListTile(
                onTap: () => setState(() => selectedMethod = 'Cash'),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                tileColor: Color(0xff3C2F2F),
                leading: Image.asset('assets/icon/cash.png', width: 50),
                title: CustomText(
                  text: 'Cash on Delivery',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Cash',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
              ),
              Gap(10),
              //debit
              ListTile(
                onTap: () => setState(() => selectedMethod = 'Visa'),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(8),
                ),
                tileColor: Color.fromARGB(255, 3, 39, 92),
                leading: Image.asset('assets/icon/visa.png', width: 50),
                title: CustomText(text: 'Debit Card', color: Colors.white),
                subtitle: CustomText(
                  text: '**** ***** 2342',
                  color: Colors.white,
                ),
                trailing: Radio<String>(
                  activeColor: Colors.white,
                  value: 'Visa',
                  groupValue: selectedMethod,
                  onChanged: (v) => setState(() => selectedMethod = v!),
                ),
              ),
              Gap(5),
              Row(
                children: [
                  Checkbox(
                    value: true,
                    activeColor: Color(0xffEF2A39),
                    onChanged: (v) {},
                  ),
                  CustomText(text: 'Save card details for future payments'),
                ],
              ),
              Gap(200),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Total', size: 16),
                  CustomText(text: '\$18.9', size: 24),
                ],
              ),
              CustomButton(
                text: 'Pay Now',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        backgroundColor: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 200,
                          ),
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade800,
                                  blurRadius: 15,
                                  offset: Offset(0, 0),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.primary,
                                  child: Icon(
                                    CupertinoIcons.check_mark,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Gap(10),
                                CustomText(
                                  text: 'Success!',
                                  color: AppColors.primary,
                                  size: 20,
                                  weight: FontWeight.bold,
                                ),
                                Gap(3),
                                CustomText(
                                  text:
                                      'Your payment was successful.\nA receipt for this purchase has\n been sent to your email.',
                                  color: Colors.grey.shade400,
                                  size: 11,
                                ),
                                Gap(10),
                                CustomButton(
                                  text: 'Close',
                                  width: 200,
                                  onTap: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

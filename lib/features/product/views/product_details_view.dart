import 'package:flutter/material.dart';
import 'package:hungry_app/features/product/widgets/spicy_slider.dart';

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
      body: Column(
        children: [
          SpicySlider(
            value: value,
            onChanged: (v) {
              setState(() {
                value = v;
              });
            },
          ),
        ],
      ),
    );
  }
}

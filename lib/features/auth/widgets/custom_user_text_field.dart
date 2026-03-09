import 'package:flutter/material.dart';

class CustomUserTextField extends StatelessWidget {
  const CustomUserTextField({
    super.key,
    required this.controller,
    required this.lable,
    this.color,
    this.keyboardType,
  });
  final TextEditingController controller;
  final String lable;
  final Color? color;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: color ?? Colors.white,
      cursorHeight: 20,
      style: TextStyle(color: color ?? Colors.white),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        labelText: lable,
        labelStyle: TextStyle(color: color ?? Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ?? Colors.white),
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ?? Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

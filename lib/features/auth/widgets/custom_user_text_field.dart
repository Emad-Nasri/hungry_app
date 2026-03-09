import 'package:flutter/material.dart';

class CustomUserTextField extends StatelessWidget {
  const CustomUserTextField({
    super.key,
    required this.controller,
    required this.lable,
    this.color,
  });
  final TextEditingController controller;
  final String lable;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: color ?? Colors.white,
      cursorHeight: 20,
      style: TextStyle(color: color ?? Colors.white),
      decoration: InputDecoration(
        labelText: lable,
        labelStyle: TextStyle(color: color ?? Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ?? Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color ?? Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

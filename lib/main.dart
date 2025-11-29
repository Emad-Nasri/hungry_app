import 'package:flutter/material.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hungry App',
      home: Root(),
    );
  }
}

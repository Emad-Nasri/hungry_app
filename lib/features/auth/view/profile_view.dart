import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  @override
  void initState() {
    _name.text = 'Knuckles';
    _email.text = 'Knuckles@gmail.com';
    _address.text = '55 Dubai,UAE';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Icon(Icons.settings, color: Colors.white),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://static.vecteezy.com/system/resources/thumbnails/009/292/244/small/default-avatar-icon-of-social-media-user-vector.jpg',
                      scale: 2,
                    ),
                  ),
                  border: Border.all(width: 5, color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            Gap(30),
            CustomUserTextField(controller: _name, lable: 'Name'),
            Gap(25),
            CustomUserTextField(controller: _email, lable: 'Email'),
            Gap(25),
            CustomUserTextField(controller: _address, lable: 'Address'),
            Gap(20),
            Divider(),
            Gap(10),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confirmPassController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(100),
                SvgPicture.asset('assets/logo/logo.svg'),
                Gap(60),
                CustomTextField(
                  controller: nameController,
                  hint: 'Name',
                  isPassword: false,
                ),
                Gap(15),
                CustomTextField(
                  controller: emailController,
                  hint: 'Email address',
                  isPassword: false,
                ),
                Gap(15),
                CustomTextField(
                  controller: passController,
                  hint: 'Password',
                  isPassword: true,
                ),
                Gap(15),
                CustomTextField(
                  controller: confirmPassController,
                  hint: 'Confirm Password',
                  isPassword: true,
                ),
                Gap(30),
                CustomAuthButton(
                  text: 'Sign Up',
                  onTap: () {
                    if (formKey.currentState!.validate())
                      print('success register');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

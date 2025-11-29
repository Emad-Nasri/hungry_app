import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey();
    return GestureDetector(
      onTap: () => FocusScope.of(
        context,
      ).unfocus(), //اذا كبست على اس شي غير التيكستفيلد بينزل الكيبورد
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Gap(100),
                  SvgPicture.asset('assets/logo/logo.svg'),
                  Gap(10),
                  CustomText(
                    text: 'Welcome Back, Discover The Best Fast Food',
                    color: Colors.white,
                    weight: FontWeight.w500,
                    size: 13,
                  ),
                  Gap(60),
                  CustomTextField(
                    controller: emailController,
                    hint: 'Email address',
                    isPassword: false,
                  ),
                  Gap(20),
                  CustomTextField(
                    controller: passController,
                    hint: 'Password',
                    isPassword: true,
                  ),
                  Gap(30),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate())
                        print('success login');
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      child: Center(
                        child: CustomText(
                          text: 'Login',
                          size: 15,
                          weight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

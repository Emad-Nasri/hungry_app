import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Gap(100),
            SvgPicture.asset('assets/logo/logo.svg', color: AppColors.primary),
            CustomText(
              text: 'Welcome to our Food App',
              color: AppColors.primary,
            ),
            Gap(40),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Gap(30),
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

                      Gap(20),
                      //signup
                      CustomAuthButton(
                        color: AppColors.primary,
                        textColor: Colors.white,
                        text: 'Sign Up',
                        onTap: () {
                          if (formKey.currentState!.validate())
                            print('success register');
                        },
                      ),
                      Gap(15),

                      //go to login
                      CustomAuthButton(
                        textColor: AppColors.primary,
                        color: Colors.white,
                        text: 'Go to login ?',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (c) {
                                return LoginView();
                              },
                            ),
                          );
                        },
                      ),
                      Gap(200),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return GestureDetector(
      onTap: () => FocusScope.of(
        context,
      ).unfocus(), //اذا كبست على اس شي غير التيكستفيلد بينزل الكيبورد
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Gap(200),
                SvgPicture.asset(
                  'assets/logo/logo.svg',
                  color: AppColors.primary,
                ),
                Gap(10),
                CustomText(
                  text: 'Welcome Back, Discover The Best Fast Food',
                  color: AppColors.primary,
                  weight: FontWeight.w500,
                  size: 13,
                ),
                Gap(60),
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
                    child: Column(
                      children: [
                        Gap(30),
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
                        CustomAuthButton(
                          color: AppColors.primary,
                          textColor: Colors.white,
                          text: 'Login',
                          onTap: () {
                            if (formKey.currentState!.validate())
                              print('success login');
                          },
                        ),
                        Gap(15),

                        //go to sign up
                        CustomAuthButton(
                          textColor: AppColors.primary,
                          color: Colors.white,
                          text: 'Create Account ?',
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) {
                                  return SignupView();
                                },
                              ),
                            );
                          },
                        ),
                        //Guest
                        Gap(10),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) {
                                  return Root();
                                },
                              ),
                            );
                          },
                          child: Text('Countinue as a guest ?'),
                        ),
                        TextButton(onPressed: () {}, child: Text('')),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

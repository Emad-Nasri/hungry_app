import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/signup_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();
  Future<void> login() async {
    setState(() => isLoading = true);
    if (formKey.currentState!.validate()) {
      try {
        final user = await authRepo.login(
          emailController.text.trim(),
          passController.text.trim(),
        );
        //trim تعالج اذا المستخدم ادخل سبيس فقط
        if (user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
        }
        setState(() => isLoading = false);
      } catch (e) {
        setState(() => isLoading = false);
        String errorMsg = 'unhandled error in login';
        if (e is ApiError) {
          errorMsg = e.message;
        }
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMsg)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
                        //login
                        isLoading
                            ? CupertinoActivityIndicator(color: Colors.white)
                            : CustomAuthButton(
                                color: AppColors.primary,
                                textColor: Colors.white,
                                text: 'Login',
                                onTap: login,
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
                          child: CustomText(
                            text: 'Countinue as a guest ?',
                            color: Colors.white,
                            weight: FontWeight.bold,
                            size: 13,
                          ),
                        ),
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

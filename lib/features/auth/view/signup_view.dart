import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_auth_button.dart';
import 'package:hungry_app/root.dart';
import 'package:hungry_app/shared/custom_snack.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:hungry_app/shared/custom_text_field.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();

  @override
  Widget build(BuildContext context) {
    Future<void> signup() async {
      if (!formKey.currentState!.validate()) return;

      setState(() => isLoading = true);

      try {
        final user = await authRepo.signup(
          nameController.text.trim(),
          emailController.text.trim(),
          passController.text.trim(),
        );

        if (user != null) {
          Navigator.push(context, MaterialPageRoute(builder: (c) => Root()));
        }
      } catch (e) {
        String errMsg = 'Error in Register';

        if (e is ApiError) {
          errMsg = e.message;
        }

        ScaffoldMessenger.of(context).showSnackBar(customSnack(errMsg));
      }

      setState(() => isLoading = false);
    }

    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          children: [
            Gap(200),
            SvgPicture.asset('assets/logo/logo.svg', color: AppColors.primary),
            CustomText(
              text: 'Welcome to our Food App',
              color: AppColors.primary,
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
                      isLoading
                          ? CupertinoActivityIndicator(color: Colors.white)
                          : CustomAuthButton(
                              color: AppColors.primary,
                              textColor: Colors.white,
                              text: 'Sign Up',
                              onTap: signup,
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

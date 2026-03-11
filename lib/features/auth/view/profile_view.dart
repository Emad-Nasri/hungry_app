import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/network/api_error.dart';
import 'package:hungry_app/features/auth/data/auth_repo.dart';
import 'package:hungry_app/features/auth/data/user_model.dart';
import 'package:hungry_app/features/auth/view/login_view.dart';
import 'package:hungry_app/features/auth/widgets/custom_user_text_field.dart';
import 'package:hungry_app/shared/custom_button.dart';
import 'package:hungry_app/shared/custom_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _visa = TextEditingController();

  UserModel? userModel;
  String? profileImage;
  String? selectedImage;
  bool isLoading = false;
  AuthRepo authRepo = AuthRepo();

  //get profile data
  Future<void> getProfileData() async {
    try {
      final user = await authRepo.getProfileData();
      setState(() {
        userModel = user;
        profileImage = user?.image;
      });
    } catch (e) {
      String errMsg = 'Error in profile';
      if (e is ApiError) {
        errMsg = e.message;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errMsg)));
    }
  }

  //update profile data
  Future<void> updateProfileData() async {
    try {
      setState(() => isLoading = true);
      final user = await authRepo.updateProfileData(
        name: _name.text.trim(),
        email: _email.text.trim(),
        address: _address.text.trim(),
        imagePath: selectedImage,
        visa: _visa.text.trim(),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Profile Updated Successfully')));
      setState(() => isLoading = false);

      setState(() => userModel = user);
      await getProfileData();
    } catch (e) {
      setState(() => isLoading = false);
      String errMsg = 'Failed to update profile';
      if (e is ApiError) {
        errMsg = e.message;
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(errMsg)));
    }
  }

  //pick image from gallery
  Future<void> pickImage() async {
    final pickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage.path;
      });
    }
  }

  @override
  void initState() {
    getProfileData().then((v) {
      print(userModel!.name);
      print(userModel!.email);
      print(userModel!.address);

      _name.text = userModel?.name.toString() ?? 'Person Name';
      _email.text = userModel?.email.toString() ?? 'PersonEmail@gmail.com';
      _address.text = userModel?.address == null
          ? 'Person Address'
          : userModel!.address!;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 40,
      color: Colors.white,
      backgroundColor: AppColors.primary,
      onRefresh: () async {
        await getProfileData();
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back, color: AppColors.primary),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(Icons.settings, color: AppColors.primary),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Skeletonizer(
                //لما بتكون الداتا مو جاية لسا بتاخد شكل الشاشة
                enabled: userModel == null,
                child: Column(
                  children: [
                    //image
                    Center(
                      child: Container(
                        height: 120,
                        width: 120,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 3,
                            color: AppColors.primary,
                          ),
                          image: DecorationImage(
                            image: FileImage(File(selectedImage ?? '')),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: selectedImage != null
                            ? Image.file(
                                File(selectedImage!),
                                fit: BoxFit.cover,
                              )
                            : (userModel?.image != null &&
                                  userModel!.image!.isNotEmpty)
                            ? Image.network(
                                userModel!.image!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, err, builder) =>
                                    Icon(Icons.person),
                              )
                            : Icon(Icons.person),
                      ),
                    ),

                    Gap(10),
                    CustomButton(
                      onTap: pickImage,
                      width: 138,
                      height: 50,
                      radius: 50,
                      text: 'Upload image',
                    ),

                    Gap(30),

                    CustomUserTextField(
                      color: AppColors.primary,
                      controller: _name,
                      lable: 'Name',
                    ),

                    Gap(30),
                    //Form
                    CustomUserTextField(
                      color: AppColors.primary,
                      controller: _email,
                      lable: 'Email',
                    ),

                    Gap(25),

                    CustomUserTextField(
                      color: AppColors.primary,
                      controller: _address,
                      lable: 'Address',
                    ),

                    Gap(20),

                    Divider(),

                    Gap(10),

                    userModel?.visa == null
                        ? CustomUserTextField(
                            color: AppColors.primary,
                            controller: _visa,
                            keyboardType: TextInputType.number,
                            lable: 'ADD VISA CARD',
                          )
                        : ListTile(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(8),
                            ),
                            tileColor: Color.fromARGB(255, 241, 243, 247),

                            leading: Image.asset(
                              'assets/icon/profile_visa.png',
                              width: 50,
                            ),

                            title: CustomText(
                              text: 'Debit Card',
                              color: Colors.black,
                            ),

                            subtitle: CustomText(
                              text: userModel?.visa ?? '**** ***** 2342',
                              color: Colors.black,
                            ),

                            trailing: CustomText(
                              text: 'Default',
                              color: Colors.black,
                            ),
                          ),
                    Gap(100),
                  ],
                ),
              ),
            ),
          ),

          bottomSheet: Container(
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey.shade800, blurRadius: 20),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //edit button
                  isLoading
                      ? CupertinoActivityIndicator()
                      : Expanded(
                          child: GestureDetector(
                            onTap: updateProfileData,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  CustomText(
                                    text: 'Edit Profile',
                                    color: Colors.white,
                                    weight: FontWeight.w600,
                                  ),
                                  Gap(5),
                                  Icon(
                                    CupertinoIcons.pencil,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                  //logout
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => LoginView()),
                        ),
                        child: Row(
                          children: [
                            CustomText(
                              text: 'Logout',
                              color: AppColors.primary,
                              weight: FontWeight.w600,
                            ),
                            Gap(5),
                            Icon(Icons.logout, color: AppColors.primary),
                          ],
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

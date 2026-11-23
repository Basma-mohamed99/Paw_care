import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/core/app_colors.dart';
import 'package:paw_care/core/reusable_compents/custom_elevate_button.dart';
import 'package:paw_care/core/reusable_compents/custom_text_field.dart';
import 'package:paw_care/presentation/register_screen/widget/custom_text_style.dart';

import '../../core/application_routes.dart';
import '../../core/reusable_compents/dialog_utils.dart';
import '../../core/sources/remote/firestore_manger.dart';
import '../../models/user_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState>formKey = GlobalKey<FormState>();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirmPasswordController=TextEditingController();
  final emailRegex =
  RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,}$');
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$', );
  final egyptianPhoneNumber = RegExp(r'^01[0125][0-9]{8}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              color: AppColors.mintgreen,
              child: SafeArea(
                child: Padding(
                  padding: context.edgeInsets(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: context.edgeInsets(left: 16),
                        decoration: BoxDecoration(
                          color: Color(0x34FFFFFF),
                          borderRadius: BorderRadius.circular(12.r),
                        ),

                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.pop(context);
                          }
                        ),
                      ),
                      SizedBox(height: 11.h),
                      Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 26.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "Join the PawCare community",
                        style: TextStyle(fontSize: 13.sp, color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: context.edgeInsets(horizontal: 24),
              child: Form(key:formKey ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextStyle(label: "First Name"),
                              SizedBox(height: 6.h),
                              CustomTextField(hintMessage: "Basma",
                                controller: firstNameController,
                                validator: (String? value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return 'Please enter your first name';
                                    }

                                    if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())) {
                                      return 'First name must contain letters only';
                                    }

                                    return null;

                                },),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextStyle(label: "Last Name"),
                              SizedBox(height: 6.h),
                              CustomTextField(hintMessage: "mohamed",
                              controller: lastNameController,
                                validator: (value){
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your last name';
                                  }

                                  if (!RegExp(r"^[a-zA-Z]+$").hasMatch(value.trim())) {
                                    return 'Last name must contain letters only';
                                  }

                                  return null;

                                },


                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    CustomTextStyle(label: "Email Address"),
                    SizedBox(height: 6.h),
                    CustomTextField(hintMessage: "Your@email.com",
                    controller: emailController,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return "please enter your email";
                        }
                        if (!emailRegex.hasMatch(value)) {
                          return"enter valid email ";
                        }
                        return null;

                      },

                    ),
                    SizedBox(height: 13.h),
                    CustomTextStyle(label: "Phone Number",

                    ),
                    SizedBox(height: 6.h),
                    CustomTextField(hintMessage: "+20 10 0000 0000",
                    controller: phoneNumberController,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return "please enter your phone number";
                        }
                        if (!egyptianPhoneNumber.hasMatch(value)) {
                          return"enter valid phone number ";
                        }
                        return null;

                      }
                    ),
                    SizedBox(height: 13.h),
                    CustomTextStyle(label: "Password"),
                    SizedBox(height: 6.h),
                    CustomTextField(hintMessage: "Enter valid password",
                     controller: passwordController,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return "plz enter a pass";
                        }
                        if (!passwordRegex.hasMatch(value)) {
                          return"enter password contain at least 8 char at least 1 capital and special char ";
                        }
                        return null;


                      },
                    ),
                    SizedBox(height: 13.h),
                    CustomTextStyle(label: "Confirm Password",),
                    SizedBox(height: 6.h),
                    CustomTextField(hintMessage: "Repeat password",
                    controller: confirmPasswordController,
                      validator: (value) {
                        if(value==null||value.isEmpty){
                          return "plz enter a pass";
                        }
                        if(value!=passwordController.text){
                          return "password not match";
                        }
                        return null;

                      },

                    ),
                    SizedBox(height: 30.h),
                    Container(width: double.infinity,
                      child: CustomElevateButton(
                        onTap: () {
                          if(formKey.currentState!.validate()){
                            createAccount();
                          }
                        },
                        forgroundcolor: AppColors.white,
                        backgroundColor: AppColors.mintgreen,
                        title: "Create Account",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  createAccount()async {
    try {
      DialogUtils.lodingDialog(context);
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      FirestoreManger.adduser(UserModel(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneNumberController.text,
        id: credential.user!.uid,

      ));
      Navigator.pop(context);
      Navigator.pushNamed(context, ApplicationRoutes.homeScreen);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        DialogUtils.exceptionDiloge(context, "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.exceptionDiloge(context, "'The account already exists for that email.''The account already exists for that email.'");}
      else {
        DialogUtils.exceptionDiloge(context, e.message!.toString());
      }

    } catch (e) {
      Navigator.pop(context);
      DialogUtils.exceptionDiloge(context, e.toString());

    }
  }
}

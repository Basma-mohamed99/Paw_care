import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paw_care/core/application_routes.dart';
import 'package:paw_care/core/reusable_compents/custom_elevate_button.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/reusable_compents/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/reusable_compents/dialog_utils.dart';

class LoginScreen extends StatefulWidget {

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailRegex =
  RegExp(r'^[\w.-]+@([\w-]+\.)+[\w-]{2,}$');
  final passwordRegex = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
  );
  GlobalKey<FormState>formKey = GlobalKey<FormState>();

  late TextEditingController emailController ;
  late TextEditingController passwordController;
@override
  void initState() {
    super.initState();
    emailController=TextEditingController();
    passwordController=TextEditingController();
  }
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();

  }

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
                bottom: false,
                child: Column(
                  children: [
                    SvgPicture.asset(AppAssets.Overlay_login),
                    SizedBox(height: 8.h),
                    Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 28.h),

            Padding(
              padding: context.edgeInsets(horizontal: 14),

              child: Form(key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email Address",
                      style: TextStyle(
                        color: AppColors.dark_green,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(hintMessage: "Your@email.com"
                   ,validator: (value) {
                      if(value==null||value.isEmpty){
                        return "please enter your email";
                      }
                       if (!emailRegex.hasMatch(value)) {
                        return"enter valid email ";
                      }
                       return null;


                    },controller: emailController,

                    ),
                    SizedBox(height: 15.h),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: AppColors.dark_green,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    CustomTextField(hintMessage: "Enter valid password",validator: (value) {
                      if(value==null||value.isEmpty){
                        return "plz enter a pass";
                      }
                       if (!passwordRegex.hasMatch(value)) {
                        return"enter password contain at least 8 char at least 1 capital and special char ";
                      }
                       return null;



                    },controller: passwordController,
                    ),
                    SizedBox(height: 12.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppColors.mintgreen,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    SizedBox(height: 26.h),
                    SizedBox(
                      width: double.infinity,
                      child: CustomElevateButton(onTap: () {
                        if(formKey.currentState!.validate()){
                          signIn();
                        }


                      },
                        forgroundcolor: Colors.white,
                        backgroundColor: AppColors.mintgreen,
                        title: "Sign In",
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(endIndent: 15, color: AppColors.lightGrey),
                        ),
                        Text(
                          "or",
                          style: TextStyle(color: AppColors.grey, fontSize: 13),
                        ),
                        Expanded(
                          child: Divider(color: AppColors.lightGrey, indent: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(14),
                        ),
                        padding: context.edgeInsets(vertical: 15),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AppAssets.google_icon,
                            width: 20.w,
                            height: 20.h,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Continue with Google",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                          SizedBox(height: 27.h),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,

                              ),
                                onPressed: () {
                                Navigator.pushNamed(context, ApplicationRoutes.registerScreen);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: AppColors.mintgreen,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
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
  signIn()async {
    try {
      DialogUtils.lodingDialog(context);
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      Navigator.pushNamed(context,ApplicationRoutes.homeScreen);

    }
    on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'weak-password') {
        DialogUtils.exceptionDiloge(context, "The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        DialogUtils.exceptionDiloge(context, "'The account already exists for that email.");
      }
      else if (e.code == 'operation-not-allowed') {
        DialogUtils.exceptionDiloge(context, "Registration is currently unavailable. Please try again later.");


      } else if (e.code == 'network-request-failed') {
        DialogUtils.exceptionDiloge(context, "Network error. Please check your internet connection.");
      }

      else {
        DialogUtils.exceptionDiloge(context, e.message!.toString());
        print(e);
      }
    } catch (e) {
      Navigator.pop(context);
      DialogUtils.exceptionDiloge(context, e.toString());
      print(e);
    }
  }
}

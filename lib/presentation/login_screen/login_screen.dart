import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paw_care/core/reusable_compents/custom_elevate_button.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';
import '../../core/reusable_compents/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                CustomTextField(hintMessage: "Your@email.com"),
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

                CustomTextField(hintMessage: "Enter valid password"),
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
                Container(
                  width: double.infinity,
                  child: CustomElevateButton(
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
                            onPressed: () {},
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
        ],
      ),
    );
  }
}

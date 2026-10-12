import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/core/app_colors.dart';
import 'package:paw_care/core/reusable_compents/custom_elevate_button.dart';
import 'package:paw_care/core/reusable_compents/custom_text_field.dart';
import 'package:paw_care/presentation/register_screen/widget/custom_text_style.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                          onPressed: () {},
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
                            CustomTextField(hintMessage: "Basma"),
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
                            CustomTextField(hintMessage: "mohamed"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  CustomTextStyle(label: "Email Address"),
                  SizedBox(height: 6.h),
                  CustomTextField(hintMessage: "Your@email.com"),
                  SizedBox(height: 13.h),
                  CustomTextStyle(label: "Phone Number"),
                  SizedBox(height: 6.h),
                  CustomTextField(hintMessage: "+20 10 0000 0000"),
                  SizedBox(height: 13.h),
                  CustomTextStyle(label: "Password"),
                  SizedBox(height: 6.h),
                  CustomTextField(hintMessage: "Enter valid password"),
                  SizedBox(height: 13.h),
                  CustomTextStyle(label: "Confirm Password"),
                  SizedBox(height: 6.h),
                  CustomTextField(hintMessage: "Repeat password"),
                  SizedBox(height: 30.h),
                  Container(width: double.infinity,
                    child: CustomElevateButton(
                      forgroundcolor: AppColors.white,
                      backgroundColor: AppColors.mintgreen,
                      title: "Create Account",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

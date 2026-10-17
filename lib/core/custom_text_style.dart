
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paw_care/core/app_colors.dart';

abstract class AppTextStyle {
  static  TextStyle nunito=GoogleFonts.nunito(
    fontWeight: FontWeight.w400,
    fontSize: 11.sp,
    color: AppColors.grey
  );
  static  TextStyle whiteNunito=GoogleFonts.nunito(
    fontWeight: FontWeight.w400,
    fontSize: 13.sp,
    color: Color(0xFFFFFFB2)
  );
  static  TextStyle outfit=GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: AppColors.black
  );  static  TextStyle titleOutfit=GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 17.sp,
    color: AppColors.black
  );
  static  TextStyle whiteOutfit=GoogleFonts.outfit(
    fontWeight: FontWeight.w700,
    fontSize: 22.sp,
    color: AppColors.white
  );
}
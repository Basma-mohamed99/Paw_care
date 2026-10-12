import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintMessage;
  const CustomTextField({super.key,required this.hintMessage});

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      decoration: InputDecoration(

        hintText: hintMessage,
          hintStyle:TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: Color(0x801a2e2b)
          ) ,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.red)
          ),
          enabledBorder: OutlineInputBorder( borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(


              color: Colors.grey
          )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),

              borderSide: BorderSide(width: 1,color: AppColors.mintgreen)
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent,width: 1),
            borderRadius: BorderRadius.circular(14.r),
          )),
      style:
      TextStyle(color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w400),);
  }
}

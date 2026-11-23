import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../app_colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller ;
  final String hintMessage;
  final String? Function(String?)? validator;

  const CustomTextField({required this.hintMessage,required this.controller,required this.validator});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      validator: widget.validator,
      controller:widget.controller ,

      decoration: InputDecoration(

        hintText: widget.hintMessage,
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

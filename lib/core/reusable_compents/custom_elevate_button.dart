import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../app_colors.dart';

class CustomElevateButton extends StatelessWidget {
  Color forgroundcolor;
  Color backgroundColor;
  String title;

  CustomElevateButton({required this.forgroundcolor,
    required this.backgroundColor,
    required this.title});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      onPressed: () {},
      style: ElevatedButton.styleFrom(
        padding: context.edgeInsets(vertical:17 ),
        backgroundColor: backgroundColor,
        foregroundColor: forgroundcolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.r),
        ),
      ),
      child: Text(title),
    );
  }
}

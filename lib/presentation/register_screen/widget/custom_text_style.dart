import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../../core/app_colors.dart';

class CustomTextStyle extends StatelessWidget {
  final  String label;
  const CustomTextStyle({
    super.key,
    required this.label
  });



  @override
  Widget build(BuildContext context) {
    return Text(label,style:
    TextStyle(fontWeight: FontWeight.w700,
        fontSize: 12.sp,
        color: AppColors.grey
    )
      ,);
  }
}

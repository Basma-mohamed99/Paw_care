import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/presentation/on_bording_screen/widgets/modelOfOBording.dart';

import '../../../core/app_colors.dart';
import '../../../core/reusable_compents/custom_elevate_button.dart';

class CustomOnBordingScreen extends StatelessWidget {
   Modelofobording modelofobording;
   CustomOnBordingScreen({
    required this.modelofobording
}
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 2,
            child:
            Image.asset(modelofobording.pathImage,width: double.infinity,fit: BoxFit.cover,)),
        Expanded(
          child: Padding(padding: context.edgeInsets(horizontal: 14),
            child: Column(children: [
              Text(
                modelofobording.title,
                style: TextStyle(
                  fontSize: 26.sp,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 11.9.h),
              Flexible(
                child: Text(
                  modelofobording.subtitle,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 26.h,),
              Row(
                children: [
                  Expanded(flex: 2,
                    child: CustomElevateButton(
                      backgroundColor: AppColors.white,
                      title: "Skip",
                      forgroundcolor: AppColors.dark_green,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(flex: 3,
                    child: CustomElevateButton(
                      backgroundColor: AppColors.mintgreen,
                      title: "Next",
                      forgroundcolor: AppColors.white,
                    ),
                  ),


                ],
              ),
            ],),
          ),
        )

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/custom_text_style.dart';
import '../../../../models/model_of_container_catogeris.dart';
import '../../widgets/custom_grid_containers_cattegoeris.dart';

class HomeTab extends StatelessWidget {
  const HomeTab ({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppColors.mintgreen,
            width: double.infinity,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: context.edgeInsets(all: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Good morning,",
                              style: AppTextStyle.whiteNunito,
                              textAlign: TextAlign.start,
                            ),
                            FittedBox(
                              child: Text(
                                "Basma 👋",
                                style: AppTextStyle.whiteOutfit,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        SvgPicture.asset(AppAssets.fcm),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: context.edgeInsets(horizontal: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quick Actions", style: AppTextStyle.titleOutfit),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) =>
                          CustomGridContainersCattegoeris(modelOfContainerCatogeris: ModelOfContainerCatogeris.modelOfContainerCatogerisList[index])
                  ),


                ]),
          ),
        ],
      ),
    );
  }
}

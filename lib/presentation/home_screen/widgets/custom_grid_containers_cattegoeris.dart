import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:paw_care/core/custom_text_style.dart';
import 'package:paw_care/models/model_of_container_catogeris.dart';


class CustomGridContainersCattegoeris extends StatelessWidget {
  final ModelOfContainerCatogeris modelOfContainerCatogeris;


   const CustomGridContainersCattegoeris({super.key,required this.modelOfContainerCatogeris});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
          color: modelOfContainerCatogeris.colorOfContainer,
      ),
          child: Padding(
            padding: context.edgeInsets(all: 16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Container(padding:context.edgeInsets(all: 6),
                decoration: BoxDecoration(color: modelOfContainerCatogeris.colorOfIcon,
                  borderRadius:  BorderRadius.circular(12.r)
      
                ),
                child: SvgPicture.asset(modelOfContainerCatogeris.imagePath,
      
      
                )),
                    SizedBox(height: 10.h,),
                    Text(modelOfContainerCatogeris.title,style: AppTextStyle.outfit,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
      
      
                    ),
            SizedBox(height: 2.h,),
            Text(modelOfContainerCatogeris.body,style: AppTextStyle.nunito,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
      
      
                  ],
                ),
          )),
    );
  }
}

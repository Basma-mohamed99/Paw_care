import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/models/model_of_product.dart';

import '../../../../../core/app_colors.dart';

class ProductWidget extends StatelessWidget {
  final ModelOfProduct model;

  const ProductWidget({required this.model});

   @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.edgeInsets(horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                model.image,
                width: double.infinity,
                height: 140.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.productName,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    model.rating,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Text(
                        model.price,
                        style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      Container(padding: context.edgeInsets(all: 5),
                        decoration: BoxDecoration(color: AppColors.mintgreen,borderRadius: BorderRadius.circular(12),


                        ),
                        child: Icon(Icons.add,color: Colors.white,),

                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

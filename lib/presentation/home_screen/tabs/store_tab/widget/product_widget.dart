import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/models/model_of_product.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/application_routes.dart';

class ProductWidget extends StatelessWidget {
  final ModelOfProduct model;

  const ProductWidget({required this.model});

  static const _dark = Color(0xFF16302E);
  static const _grey = Color(0xFF7A8B89);
  static const _orange = Color(0xFFF4A261);

  @override
  Widget build(BuildContext context) {
    final double rating = double.tryParse(model.rating) ?? 0;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ApplicationRoutes.categoeryDetailsScreen,
            arguments: model);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الصورة بتاخد المساحة المتبقية (عشان مفيش overflow)
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  model.image,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFDDE8E6),
                    child: const Icon(Icons.pets, color: Colors.white, size: 36),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 12.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.category,
                    style: TextStyle(fontSize: 11.sp, color: _grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    model.productName,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: _dark,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      ...List.generate(5, (i) {
                        final icon = rating >= i + 1
                            ? Icons.star_rounded
                            : rating > i
                            ? Icons.star_half_rounded
                            : Icons.star_outline_rounded;
                        return Icon(icon,
                            size: 13.sp, color: const Color(0xFFF2C14E));
                      }),
                      SizedBox(width: 4.w),
                      Text(
                        model.rating,
                        style: TextStyle(fontSize: 11.sp, color: _grey),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'EGP ${model.price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w800,
                            color: _dark,
                          ),
                        ),
                      ),
                      Container(
                        width: 32.r,
                        height: 32.r,
                        decoration: BoxDecoration(
                          color: _orange,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Icon(Icons.add, color: Colors.white, size: 18.sp),
                      ),
                    ],
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
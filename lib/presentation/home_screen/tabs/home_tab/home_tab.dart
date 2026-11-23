import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/custom_text_style.dart';
import '../../../../models/model_of_container_catogeris.dart';
import '../../widgets/custom_grid_containers_cattegoeris.dart';

// ───────── Placeholder data (استبدليهم بالموديلز الحقيقية) ─────────
class _RescueCase {
  final String title, image, status, urgency, city;
  const _RescueCase(this.title, this.image, this.status, this.urgency, this.city);
}

class _AdoptPet {
  final String name, breed, info, image;
  const _AdoptPet(this.name, this.breed, this.info, this.image);
}

class HomeTab extends StatelessWidget {
  /// اختياري: بيغيّر التاب في HomeScreen (0 Home, 1 Rescue, 2 Adopt, 3 Store, 4 Chat, 5 Profile)
  final ValueChanged<int>? onTabSelected;

  const HomeTab({super.key, this.onTabSelected});

  static const _dark = Color(0xFF16302E);
  static const _grey = Color(0xFF7A8B89);

  // TODO: حطي لينكات الصور الحقيقية
  static const _rescueCases = [
    _RescueCase('Stray Dog', '', 'Reported', 'High', 'Cairo'),
    _RescueCase('Injured Cat', '', 'In Progress', 'Medium', 'Giza'),
  ];

  static const _adoptPets = [
    _AdoptPet('Buddy', 'Golden Retriever Mix', '2 years · Male', ''),
    _AdoptPet('Luna', 'Persian Mix', '1 year · Female', ''),
    _AdoptPet('Max', 'Labrador Mix', '3 years · Male', ''),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ───────── Header (بتاعك + خانة البحث)
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
                        const Spacer(),
                        SvgPicture.asset(AppAssets.fcm),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 20.h),
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: 'Search animals, products...',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.75),
                          fontSize: 14.sp,
                        ),
                        prefixIcon: Icon(Icons.search,
                            color: Colors.white.withOpacity(0.9)),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.2),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // ───────── Quick Actions (بتاعك)
          Padding(
            padding: context.edgeInsets(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Quick Actions", style: AppTextStyle.titleOutfit),
                SizedBox(height: 8.h),
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
                      CustomGridContainersCattegoeris(
                        modelOfContainerCatogeris: ModelOfContainerCatogeris
                            .modelOfContainerCatogerisList[index],
                      ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22.h),

          // ───────── Active Rescue Cases
          _sectionTitle(context, 'Active Rescue Cases',
              onSeeAll: () => onTabSelected?.call(1)),
          SizedBox(height: 12.h),
          SizedBox(
            height: 215.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemCount: _rescueCases.length,
              separatorBuilder: (_, __) => SizedBox(width: 14.w),
              itemBuilder: (_, i) => _rescueCard(_rescueCases[i]),
            ),
          ),
          SizedBox(height: 22.h),

          // ───────── Ready for Adoption
          _sectionTitle(context, 'Ready for Adoption',
              onSeeAll: () => onTabSelected?.call(2)),
          SizedBox(height: 12.h),
          SizedBox(
            height: 225.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              itemCount: _adoptPets.length,
              separatorBuilder: (_, __) => SizedBox(width: 14.w),
              itemBuilder: (_, i) => _adoptCard(_adoptPets[i]),
            ),
          ),
          SizedBox(height: 22.h),

          // ───────── Shop banner
          _shopBanner(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  // ───────────────────────── Section title
  Widget _sectionTitle(BuildContext context, String title,
      {VoidCallback? onSeeAll}) {
    return Padding(
      padding: context.edgeInsets(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: AppTextStyle.titleOutfit),
          if (onSeeAll != null)
            GestureDetector(
              onTap: onSeeAll,
              child: Text(
                'See all',
                style: TextStyle(
                  color: AppColors.mintgreen,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ───────────────────────── Image with placeholder
  Widget _netImage(String url, {required double height}) {
    final placeholder = Container(
      height: height,
      width: double.infinity,
      color: const Color(0xFFDDE8E6),
      child: const Icon(Icons.pets, color: Colors.white, size: 40),
    );
    if (url.isEmpty) return placeholder;
    return Image.network(
      url,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => placeholder,
    );
  }

  BoxDecoration get _cardDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(20.r),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.06),
        blurRadius: 12,
        offset: const Offset(0, 4),
      ),
    ],
  );

  // ───────────────────────── Rescue card
  Widget _rescueCard(_RescueCase c) {
    final inProgress = c.status == 'In Progress';
    final chipBg =
    inProgress ? const Color(0xFFE3EEFB) : const Color(0xFFFEEBDD);
    final chipText =
    inProgress ? const Color(0xFF3B7DD8) : const Color(0xFFE8873A);
    final dotColor = switch (c.urgency) {
      'High' => const Color(0xFFE76F51),
      'Medium' => const Color(0xFFF4A261),
      _ => const Color(0xFF57CC99),
    };

    return Container(
      width: 200.w,
      decoration: _cardDecoration,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _netImage(c.image, height: 110.h),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        c.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: _dark,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        color: chipBg,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Text(
                        c.status,
                        style: TextStyle(
                          color: chipText,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Container(
                      width: 8.r,
                      height: 8.r,
                      decoration:
                      BoxDecoration(color: dotColor, shape: BoxShape.circle),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      '${c.urgency} · ${c.city}',
                      style: TextStyle(color: _grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────── Adoption card
  Widget _adoptCard(_AdoptPet p) {
    return Container(
      width: 150.w,
      decoration: _cardDecoration,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _netImage(p.image, height: 120.h),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.name,
                  style: TextStyle(
                    color: _dark,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 3.h),
                Text(
                  p.breed,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: _grey, fontSize: 12.sp),
                ),
                SizedBox(height: 2.h),
                Text(
                  p.info,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: _grey, fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────── Shop banner
  Widget _shopBanner() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF4A261), Color(0xFFE07B39)],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shop Pet Supplies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Food, toys & accessories',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 13.sp,
                  ),
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () => onTabSelected?.call(3),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: const Color(0xFFE07B39),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                        horizontal: 22.w, vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'Shop Now',
                    style:
                    TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w800),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.shopping_cart_outlined,
            size: 72.sp,
            color: Colors.white.withOpacity(0.7),
          ),
        ],
      ),
    );
  }
}
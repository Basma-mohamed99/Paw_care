import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/core/app_colors.dart';
import 'package:paw_care/provider/user_provider.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  static const _lightTeal = Color(0xFFE0F2EF);
  static const _dark = Color(0xFF16302E);
  static const _grey = Color(0xFF7A8B89);
  static const _bg = Color(0xFFF4F9F8);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<UserProvider>(context, listen: false).getUser();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: true);
    final user = provider.user;

    final firstName = user?.firstName ?? '';
    final lastName = user?.lastName ?? '';
    final fullName = '$firstName $lastName'.trim();
    final email = user?.email ?? '';
    final initial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '?';

    // TODO: اربطيهم بالداتا الحقيقية
    const reports = 3;
    const adoptions = 1;
    const orders = 8;
    const savedPets = 4;

    return Container(
      color: _bg,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildHeader(user == null, fullName, email, initial),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -40.h,
                  child: _buildStatsCard(reports, adoptions, orders),
                ),
              ],
            ),
            SizedBox(height: 56.h),

            // ───────── Menu
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 24.h),
              child: Column(
                children: [
                  _menuTile(
                    highlighted: true,
                    leading: Container(
                      width: 48.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        color: AppColors.mintgreen,
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      child: Icon(Icons.add, color: Colors.white, size: 26.sp),
                    ),
                    title: 'List a Pet for Adoption',
                    subtitle: 'Create a new adoption listing',
                    onTap: () {
                      // TODO: navigate
                    },
                  ),
                  SizedBox(height: 12.h),
                  _menuTile(
                    leading: _emojiBox('🆘'),
                    title: 'My Rescue Reports',
                    subtitle: '$reports reports submitted',
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  _menuTile(
                    leading: _emojiBox('🐾'),
                    title: 'My Adoption Requests',
                    subtitle: '$adoptions pending approval',
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  _menuTile(
                    leading: _emojiBox('📦'),
                    title: 'Order History',
                    subtitle: '$orders past orders',
                    onTap: () {},
                  ),
                  SizedBox(height: 12.h),
                  _menuTile(
                    leading: _emojiBox('❤️'),
                    title: 'Saved Pets',
                    subtitle: '$savedPets pets saved',
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(
      bool loading, String fullName, String email, String initial) {
    return Container(
      width: double.infinity,
      color: AppColors.mintgreen,
      padding: EdgeInsets.only(bottom: 64.h),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 24.sp,
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Container(
                    width: 80.r,
                    height: 80.r,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.25),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.6),
                        width: 3,
                      ),
                    ),
                    child: Text(
                      initial,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: loading
                        ? const Align(
                      alignment: Alignment.centerLeft,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                        : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 22.sp,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          email,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 13.sp,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            'Pet Owner',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ───────────────────────── Stats card
  Widget _buildStatsCard(int reports, int adoptions, int orders) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _stat('$reports', 'Reports'),
          _stat('$adoptions', 'Adoptions'),
          _stat('$orders', 'Orders'),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            color: AppColors.mintgreen,
            fontSize: 24.sp,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 2.h),
        Text(label, style: TextStyle(color: _grey, fontSize: 13.sp)),
      ],
    );
  }

  // ───────────────────────── Menu pieces
  Widget _emojiBox(String emoji) {
    return Container(
      width: 48.r,
      height: 48.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: _lightTeal,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Text(emoji, style: TextStyle(fontSize: 22.sp)),
    );
  }

  Widget _menuTile({
    required Widget leading,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool highlighted = false,
  }) {
    return Material(
      color: highlighted ? _lightTeal : Colors.white,
      elevation: highlighted ? 0 : 1,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: BorderSide(
          color: highlighted ? AppColors.mintgreen : Colors.transparent,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(14.r),
          child: Row(
            children: [
              leading,
              SizedBox(width: 14.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: highlighted ? AppColors.mintgreen : _dark,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      subtitle,
                      style: TextStyle(color: _grey, fontSize: 12.sp),
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: _grey, size: 24.sp),
            ],
          ),
        ),
      ),
    );
  }
}
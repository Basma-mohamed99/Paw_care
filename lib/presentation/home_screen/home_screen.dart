import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:paw_care/presentation/home_screen/tabs/adopt_tab/adopt_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/chat_tab/chat_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/home_tab/home_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/rescue_tap/rescue_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/store_tab.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  static const _inactive = Color(0xFF7A8B89);

  void _goToTab(int index) => setState(() => selectedIndex = index);

  // أيقونة SVG بتتلوّن حسب الاختيار
  Widget _svgIcon(String asset, {required bool selected}) {
    return SvgPicture.asset(
      asset,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        selected ? AppColors.mintgreen : _inactive,
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = <Widget>[
      HomeTab(onTabSelected: _goToTab),
      const RescueTab(),
      const AdoptTab(),
      const StoreTab(),
      const ChatTab(),
      const ProfileTab(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F8),
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: selectedIndex, children: screens),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          height: 68,
          indicatorColor: Colors.transparent,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final selected = states.contains(WidgetState.selected);
            return TextStyle(
              fontSize: 11,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              color: selected ? AppColors.mintgreen : _inactive,
            );
          }),
        ),
        child: NavigationBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 8,
          selectedIndex: selectedIndex,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: _goToTab,
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.home_outlined, color: _inactive),
              selectedIcon: Icon(Icons.home_rounded, color: AppColors.mintgreen),
              label: 'Home',
            ),
            NavigationDestination(
              icon: _svgIcon(AppAssets.sos_icon, selected: false),
              selectedIcon: _svgIcon(AppAssets.sos_icon, selected: true),
              label: 'Rescue',
            ),
            NavigationDestination(
              icon: _svgIcon(AppAssets.adopt_icon, selected: false),
              selectedIcon: _svgIcon(AppAssets.adopt_icon, selected: true),
              label: 'Adopt',
            ),
            NavigationDestination(
              icon: _svgIcon(AppAssets.shop_icon, selected: false),
              selectedIcon: _svgIcon(AppAssets.shop_icon, selected: true),
              label: 'Store',
            ),
            NavigationDestination(
              icon: _svgIcon(AppAssets.chat_icon, selected: false),
              selectedIcon: _svgIcon(AppAssets.chat_icon, selected: true),
              label: 'Chat',
            ),
            const NavigationDestination(
              icon: Icon(Icons.person_outline, color: _inactive),
              selectedIcon: Icon(Icons.person, color: AppColors.mintgreen),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
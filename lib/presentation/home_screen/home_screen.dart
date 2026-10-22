import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:paw_care/presentation/home_screen/tabs/adopt_tab/adopt_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/chat_tab/chat_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/home_tab/home_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/rescue_tap/rescue_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/store_tab.dart';

import '../../core/app_assets.dart';
import '../../core/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens=[
    HomeTab(),
    RescueTab(),
    AdoptTab(),
    StoreTab(),
    ChatTab(),];
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(0xf4ffffff),

      bottomNavigationBar: NavigationBar(indicatorColor: AppColors.lightgreen,
        backgroundColor: AppColors.lightGrey,
        selectedIndex:selectedIndex ,
        labelBehavior:NavigationDestinationLabelBehavior.onlyShowSelected ,
        onDestinationSelected: (value) {
          selectedIndex=value;
          setState(() {

          });
        },
        destinations: [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home"),
        NavigationDestination(icon: SvgPicture.asset(AppAssets.adopt_icon), label: "rescue"),

        NavigationDestination(icon: SvgPicture.asset(AppAssets.sos_icon), label: "adopt"),
        NavigationDestination(icon: SvgPicture.asset(AppAssets.shop_icon), label: "Store"),
        NavigationDestination(icon: SvgPicture.asset(AppAssets.chat_icon), label: "Chat"),


      ],


      ),
        resizeToAvoidBottomInset: false,
        body: screens[selectedIndex],
        );
    }
}


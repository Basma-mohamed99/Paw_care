import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:paw_care/core/custom_text_style.dart';
import 'package:paw_care/models/model_of_container_catogeris.dart';
import 'package:paw_care/presentation/home_screen/tabs/adopt_tab/adopt_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/chat_tab/chat_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/home_tab/home_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/rescue_tap/rescue_tab.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/store_tab.dart';
import 'package:paw_care/presentation/home_screen/widgets/custom_grid_containers_cattegoeris.dart';

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
    return Scaffold(

      bottomNavigationBar: NavigationBar(indicatorColor: AppColors.lightgreen,
        selectedIndex:selectedIndex ,
        labelBehavior:NavigationDestinationLabelBehavior.onlyShowSelected ,
        onDestinationSelected: (value) {
          selectedIndex=value;
          setState(() {

          });
        },
        destinations: [
        NavigationDestination(icon: Icon(Icons.home), label: "Home"),
        NavigationDestination(icon: SvgPicture.asset(AppAssets.adopt_icon,width: 30.w,), label: "rescue"),

        NavigationDestination(icon: SvgPicture.asset(AppAssets.sos_icon,width: 30.w,), label: "adopt"),
        NavigationDestination(icon: SvgPicture.asset(AppAssets.shop_icon,width: 30.w,), label: "adopt"),
        NavigationDestination(icon: SvgPicture.asset(AppAssets.chat_icon,width: 30.w,), label: "Chat"),


      ],


      ),
        resizeToAvoidBottomInset: false,
        body: screens[selectedIndex],
        );
    }
}


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/core/sources/local/shared_perfs.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/cart_screen/cart_screen.dart';
import 'package:paw_care/presentation/home_screen/tabs/store_tab/widget/categoer_details_screen.dart';
import 'package:paw_care/presentation/on_bording_screen/on_bording_screen.dart';
import 'package:paw_care/provider/All_product_json_provider.dart';
import 'package:paw_care/provider/cart_item_provider.dart';
import 'package:paw_care/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'core/application_routes.dart';
import 'presentation/home_screen/home_screen.dart';
import 'presentation/login_screen/login_screen.dart';
import 'presentation/register_screen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPerfs.init();
  final productsProvider = AllProductJsonProvider();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(providers: [
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => CartItemProvider(),
          ), ChangeNotifierProvider(
            create: (context) => AllProductJsonProvider(),
          ),

        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              ApplicationRoutes.onBordingScreen: (context) => OnBordingScreen(),
              ApplicationRoutes.homeScreen:  (context) =>  HomeScreen(),
              ApplicationRoutes.loginScreen: (context) => LoginScreen(),
              ApplicationRoutes.registerScreen: (context) => RegisterScreen(),
              ApplicationRoutes.categoeryDetailsScreen: (context) => CategoerDetailsScreen(),
              ApplicationRoutes.cartScreen: (context) => CartScreen(),
            },
          
            initialRoute: FirebaseAuth.instance.currentUser==null
          ? ApplicationRoutes.loginScreen
            : ApplicationRoutes.homeScreen,
          ),
        );
      },
    );
  }
}
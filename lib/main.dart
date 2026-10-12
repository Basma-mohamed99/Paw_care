import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:paw_care/presentation/on_bording_screen/on_bording_screen.dart';
import 'core/application_routes.dart';
import 'presentation/home_screen/home_screen.dart';
import 'presentation/login_screen/login_screen.dart';
import 'presentation/register_screen/register_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(390, 884),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes:{
            ApplicationRoutes.onBordingScreen: (context) => OnBordingScreen(),
            ApplicationRoutes.homeScreen: (context) => HomeScreen(),
            ApplicationRoutes.loginScreen: (context) => LoginScreen(),
            ApplicationRoutes.registerScreen: (context) => RegisterScreen(),

          },
          initialRoute: ApplicationRoutes.onBordingScreen,

        );
      },
    );
  }
}
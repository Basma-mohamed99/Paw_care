import 'package:flutter/material.dart';
import 'package:paw_care/core/app_assets.dart';
import 'package:paw_care/presentation/on_bording_screen/widgets/custom_on_bording_screen.dart';
import 'package:paw_care/presentation/on_bording_screen/widgets/modelOfOBording.dart';

class OnBordingScreen extends StatelessWidget {
  List<Modelofobording> onbordingdata = [
    Modelofobording(
      pathImage: AppAssets.onBording1,
      title: "Report & Rescue Animals ",
      subtitle:
          "Spot a stray or injured animal? "
          "Report it instantly"
          "with photos and GPS location."
          " Volunteers will"
          " respond quickly.",
    ),
    Modelofobording(
      pathImage: AppAssets.onBording2,
      title: "Adopt a Pet ",
      subtitle:
          "Browse animals available for adoption from"
          "shelters nearby. Give a pet a loving forever home.",
    ),
    Modelofobording(
      pathImage: AppAssets.onBording2,
      title: "Shop Pet Supplies ",
      subtitle:
          "Find everything your pet needs — food, toys"
          "accessories — all in one place with easy checkout",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomOnBordingScreen(modelofobording: onbordingdata[0]),
    );
  }
}

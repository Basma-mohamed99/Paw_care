import 'package:flutter/material.dart';
import 'package:paw_care/core/app_assets.dart';

import '../core/app_colors.dart';

class ModelOfContainerCatogeris {
  final String title;
  final String body;
  final String imagePath;
  final Color colorOfContainer;

  final Color colorOfIcon;

  const ModelOfContainerCatogeris({
    required this.title,
    required this.body,
    required this.imagePath,
    required this.colorOfContainer,
    required this.colorOfIcon,
  });

  static const List<ModelOfContainerCatogeris> modelOfContainerCatogerisList = [
    ModelOfContainerCatogeris(
      title: "Report Animal",
      body: "Emergency rescue",
      imagePath: AppAssets.sos_icon,
      colorOfContainer: AppColors.card1,
      colorOfIcon: AppColors.iconColorOfCard1,
    ),
    ModelOfContainerCatogeris(
      title: "Adopt a Pet",
      body: "Find your companion",
      imagePath: AppAssets.adopt_icon,
      colorOfContainer: AppColors.card2,
      colorOfIcon: AppColors.iconColorOfCard2,
    ),
    ModelOfContainerCatogeris(
      title: "Shop Supplies",
      body: "Food, toys & moree",
      imagePath: AppAssets.shop_icon,
      colorOfContainer: AppColors.card3,
      colorOfIcon: AppColors.iconColorOfCard3,
    ),
    ModelOfContainerCatogeris(
      title: "Chat",
      body: "Talk to volunteers",
      imagePath: AppAssets.shop_icon,
      colorOfContainer: AppColors.card4,
      colorOfIcon: AppColors.iconColorOfCard4,
    ),
  ];
}

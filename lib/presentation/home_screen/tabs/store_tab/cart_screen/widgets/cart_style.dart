
import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF1E7A6D);
  static const text = Color(0xFF17302C);
  static const muted = Color(0xFF5F6F6C);
  static const border = Color(0xFFD5E3E0);
}

BoxDecoration cardDecoration() => BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: AppColors.primary.withOpacity(0.08),
      blurRadius: 14,
      offset: const Offset(0, 4),
    ),
  ],
);
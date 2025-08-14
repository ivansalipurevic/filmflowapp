import 'package:filmflowapp/themes/app_theme.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    fontFamily: 'Roboto',
    color: AppColors.black,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    fontFamily: 'Roboto',
    color: AppColors.black,
  );

  static const TextStyle listTileTitle = TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto',
    color: AppColors.black,
  );

  static const TextStyle listTileTrailing = TextStyle(
    color: Colors.grey,
    fontFamily: 'Roboto',
  );
}

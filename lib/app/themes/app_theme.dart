import 'package:dashbaord/app/themes/app_colors.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: AppColors.greyOpacity,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      shadowColor: AppColors.grey.withOpacity(0.5),
      color: Colors.white,
      elevation: 3.0,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: AppColors.grey,
        fontSize: 18,
      ),
      titleSmall: TextStyle(
        color: AppColors.darkGrey,
        fontSize: 14,
      ),
      labelMedium: TextStyle(
        fontSize: 10,
        color: Colors.white,
      ),
    ),
    cardTheme: CardTheme(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.5),
      ),
    ),
  );
}

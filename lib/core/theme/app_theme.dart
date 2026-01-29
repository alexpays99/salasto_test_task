import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.backgroundDark,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primaryBlue,
          secondary: AppColors.primaryBlueLight,
          surface: AppColors.surfaceCard,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.transparent,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.iconDefault,
        ),
      );
}

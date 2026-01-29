import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

abstract final class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.exodusFruit,
          secondary: AppColors.listenGradientStart,
          surface: AppColors.surfaceCard,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.transparent,
          elevation: 0,
        ),
        iconTheme: const IconThemeData(
          color: AppColors.textPrimary,
        ),
      );
}

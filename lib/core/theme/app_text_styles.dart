import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

abstract final class AppTextStyles {
  /// Folker 24/Regular — line-height 100%.
  static TextStyle get storyTitle => TextStyle(
    fontFamily: 'Folker',
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  /// DM Sans 24/Bold — line-height 31.2px (1.3).
  static TextStyle get heading1 => GoogleFonts.dmSans(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3, // 31.2px
  );

  /// DM Sans 18/Bold — line-height 18px (1.0).
  static TextStyle get heading2 => GoogleFonts.dmSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0, // 18px
  );

  /// DM Sans 16/Regular — line-height 24px (1.5).
  static TextStyle get bodyLarge => GoogleFonts.dmSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5, // 24px
  );

  /// DM Sans 14/Regular — line-height 21px (1.5).
  static TextStyle get bodyMedium => GoogleFonts.dmSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5, // 21px
  );

  /// DM Sans 12/Regular — line-height 16.8px (1.4).
  static TextStyle get bodySmall => GoogleFonts.dmSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
    height: 1.4, // 16.8px
  );

  /// DM Sans 18/Bold — line-height 18px (1.0).
  static TextStyle get buttonXL => GoogleFonts.dmSans(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.0, // 18px
  );

  /// DM Sans 14/SemiBold — line-height 14px (1.0).
  static TextStyle get buttonSecondary => GoogleFonts.dmSans(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.0, // 14px
  );

  /// DM Sans 12/SemiBold — line-height 12px (1.0).
  static TextStyle get tag => GoogleFonts.dmSans(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.0, // 12px
  );

  /// DM Sans 16/Regular — line-height 24px (1.5).
  static TextStyle get lessonsBody => GoogleFonts.dmSans(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.textTertiary,
    height: 1.5, // 24px
  );
}

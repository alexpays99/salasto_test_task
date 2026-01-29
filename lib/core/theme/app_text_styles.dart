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

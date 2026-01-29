import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.actionType,
    required this.onTap,
  });

  final ActionType actionType;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final (label, svgAsset, gradientColors, borderRadius) = switch (actionType) {
      ActionType.listen => (
        AppStrings.listen,
        AppAssets.iconSpeaker,
        const [AppColors.listenGradientStart, AppColors.listenGradientEnd],
        BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      ActionType.read => (
        AppStrings.read,
        AppAssets.iconBookOpen,
        const [AppColors.readGradientStart, AppColors.readGradientEnd],
        BorderRadius.only(
          bottomLeft: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
    };

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 64.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradientColors,
          ),
          borderRadius: borderRadius,
          border: Border.all(color: AppColors.borderGradientStart, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgAsset,
              width: 24.sp,
              height: 24.sp,
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),
            Text(label, style: AppTextStyles.buttonXL),
          ],
        ),
      ),
    );
  }
}

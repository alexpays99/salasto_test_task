import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';

/// "Lessons Learnt" card with locked state.
class LessonsLearntWidget extends StatelessWidget {
  const LessonsLearntWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.borderGradientStart,
            AppColors.borderGradientEnd,
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(1),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: const _LockedContent(),
      ),
    );
  }
}

class _LockedContent extends StatelessWidget {
  const _LockedContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(AppStrings.lessonsLearnt, style: AppTextStyles.heading2),
        ),
        SizedBox(height: 16.h),
        const _HumanAvatar(),
        SizedBox(height: 16.h),
        Text(
          AppStrings.lessonsLockedDescription,
          style: AppTextStyles.lessonsBody,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class _HumanAvatar extends StatelessWidget {
  const _HumanAvatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.w,
      height: 60.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.exodusFruit, width: 1.25),
      ),
      child: ClipOval(
        child: Image.asset(AppAssets.humanImage, fit: BoxFit.cover),
      ),
    );
  }
}


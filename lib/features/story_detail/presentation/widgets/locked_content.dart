import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';

class LockedContent extends StatelessWidget {
  const LockedContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(AppStrings.lessonsLearnt, style: AppTextStyles.heading2),
        ),
        SizedBox(height: 16.h),
        const HumanAvatar(),
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

class HumanAvatar extends StatelessWidget {
  const HumanAvatar({super.key});

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

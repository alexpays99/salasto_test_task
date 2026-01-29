import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_state.dart';

/// "Lessons Learnt" card with locked state.
class LessonsLearntWidget extends StatelessWidget {
  const LessonsLearntWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StoryDetailBloc, StoryDetailState, bool>(
      selector: (state) => state.isLessonsUnlocked,
      builder: (context, isUnlocked) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(
            color: AppColors.borderGradientStart,
            width: 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadowDark,
              blurRadius: 15,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: isUnlocked
            ? const _UnlockedContent()
            : const _LockedContent(),
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
          child: Text(
            AppStrings.lessonsLearnt,
            style: AppTextStyles.heading2,
          ),
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
        border: Border.all(
          color: AppColors.exodusFruit,
          width: 1.25,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          AppAssets.humanImage,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _UnlockedContent extends StatelessWidget {
  const _UnlockedContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.lessonsLearnt,
          style: AppTextStyles.heading2,
        ),
        SizedBox(height: 12.h),
        Text(
          AppStrings.lessonsLockedDescription,
          style: AppTextStyles.lessonsBody,
        ),
      ],
    );
  }
}

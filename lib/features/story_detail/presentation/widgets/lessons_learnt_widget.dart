import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_state.dart';

class LessonsLearntWidget extends StatelessWidget {
  const LessonsLearntWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StoryDetailBloc, StoryDetailState, bool>(
      selector: (state) => state.isLessonsUnlocked,
      builder: (context, isUnlocked) => Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.divider,
            width: 1,
          ),
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
        Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
            color: AppColors.locked.withValues(alpha: 0.3),
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.lock_outline,
            color: AppColors.locked,
            size: 28.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          AppStrings.lessonsLearnt,
          style: AppTextStyles.heading2,
        ),
        SizedBox(height: 8.h),
        Text(
          AppStrings.lessonsLockedDescription,
          style: AppTextStyles.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
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
          style: AppTextStyles.bodyMedium,
        ),
      ],
    );
  }
}

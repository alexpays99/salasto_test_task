import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_state.dart';

class TagsRow extends StatelessWidget {
  const TagsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryDetailBloc, StoryDetailState>(
      builder: (context, state) {
        final story = state.story;
        if (story == null) return const SizedBox.shrink();

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...story.tags.map(
              (tag) => Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: TagChip(
                  label: switch (tag) {
                    StoryTag.wisdom => AppStrings.tagWisdom,
                    StoryTag.courage => AppStrings.tagCourage,
                  },
                ),
              ),
            ),
            DurationChip(duration: story.duration),
          ],
        );
      },
    );
  }
}

class TagChip extends StatelessWidget {
  const TagChip({super.key, required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(100.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowDark,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      child: Center(
        child: Text(
          label,
          style: AppTextStyles.tag.copyWith(color: AppColors.surfaceCard),
        ),
      ),
    );
  }
}

class DurationChip extends StatelessWidget {
  const DurationChip({super.key, required this.duration});
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(100.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.iconTimer,
            width: 15.sp,
            height: 15.sp,
            colorFilter: const ColorFilter.mode(
              AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            duration,
            style: AppTextStyles.tag.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

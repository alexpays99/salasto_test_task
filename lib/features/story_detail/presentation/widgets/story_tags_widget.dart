import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_state.dart';

class StoryTagsWidget extends StatelessWidget {
  const StoryTagsWidget({super.key});

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
                child: _TagChip(
                  label: switch (tag) {
                    StoryTag.wisdom => AppStrings.tagWisdom,
                    StoryTag.courage => AppStrings.tagCourage,
                  },
                ),
              ),
            ),
            _DurationChip(duration: story.duration),
          ],
        );
      },
    );
  }
}

class _TagChip extends StatelessWidget {
  final String label;

  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.tagBackground,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.tagBorder, width: 1),
      ),
      child: Text(label, style: AppTextStyles.tag),
    );
  }
}

class _DurationChip extends StatelessWidget {
  final String duration;

  const _DurationChip({required this.duration});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.access_time_filled,
          size: 15.sp,
          color: AppColors.exodusFruit,
        ),
        SizedBox(width: 5.w),
        Text(
          duration,
          style: AppTextStyles.tag.copyWith(color: AppColors.textSecondary),
        ),
      ],
    );
  }
}

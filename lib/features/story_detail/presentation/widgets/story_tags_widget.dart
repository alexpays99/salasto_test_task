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
    return BlocSelector<StoryDetailBloc, StoryDetailState, List<StoryTag>>(
      selector: (state) => state.story?.tags ?? [],
      builder: (context, tags) {
        if (tags.isEmpty) return const SizedBox.shrink();

        return Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: tags.map((tag) => _StoryTagChip(tag: tag)).toList(),
        );
      },
    );
  }
}

class _StoryTagChip extends StatelessWidget {
  final StoryTag tag;

  const _StoryTagChip({required this.tag});

  @override
  Widget build(BuildContext context) {
    final (label, color) = switch (tag) {
      StoryTag.wisdom => (AppStrings.tagWisdom, AppColors.tagWisdom),
      StoryTag.courage => (AppStrings.tagCourage, AppColors.tagCourage),
      StoryTag.pirate => (AppStrings.tagPirate, AppColors.tagPirate),
    };

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: color.withValues(alpha: 0.5),
          width: 1,
        ),
      ),
      child: Text(label, style: AppTextStyles.tag),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_event.dart';
import '../bloc/story_detail_state.dart';

/// Full hero section: image + overlapping content card with
/// star, title, tags, description, and quest row.
class StoryHeaderWidget extends StatelessWidget {
  const StoryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _StoryImage(),
        Positioned(
          top: 57.h,
          left: 20.w,
          right: 20.w,
          child: const _ImageTopBar(),
        ),
        Positioned(left: 0, right: 0, bottom: 0, child: const _ContentCard()),
      ],
    );
  }
}

class _StoryImage extends StatelessWidget {
  const _StoryImage();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.storyImage,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class _ImageTopBar extends StatelessWidget {
  const _ImageTopBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CircleIconButton(
          icon: Icons.close,
          onTap: () => Navigator.of(context).maybePop(),
        ),
        _CircleIconButton(icon: Icons.ios_share, onTap: () {}),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: const BoxDecoration(
          color: AppColors.surfaceOverlay,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: 24.sp),
      ),
    );
  }
}

/// Gradient card overlapping bottom of the image.
class _ContentCard extends StatelessWidget {
  const _ContentCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(8.w, 16.h, 8.w, 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     AppColors.background.withValues(alpha: 0.0),
        //     AppColors.background.withValues(alpha: 0.75),
        //     AppColors.background,
        //   ],
        //   stops: const [0.0, 0.35, 0.65],
        // ),
      ),
      child: Column(
        children: [
          Image.asset(AppAssets.softStar, width: 33.w, height: 44.h),
          SizedBox(height: 10.h),
          Text(
            AppStrings.storyTitle,
            style: AppTextStyles.heading1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          const _TagsRow(),
          SizedBox(height: 10.h),
          Text(
            AppStrings.storyDescription,
            style: AppTextStyles.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          const _QuestRow(),
        ],
      ),
    );
  }
}

class _TagsRow extends StatelessWidget {
  const _TagsRow();

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

class _QuestRow extends StatelessWidget {
  const _QuestRow();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryDetailBloc, StoryDetailState>(
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 48.h,
              child: OutlinedButton.icon(
                onPressed: () => context.read<StoryDetailBloc>().add(
                  const StoryDetailQuestToggled(),
                ),
                icon: Icon(
                  state.isInQuest
                      ? Icons.check_circle
                      : Icons.add_circle_outline,
                  size: 20.sp,
                  color: AppColors.textPrimary,
                ),
                label: Text(
                  AppStrings.addToQuest,
                  style: AppTextStyles.buttonSecondary,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.tagBorder, width: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),
          _BookmarkButton(isBookmarked: state.isBookmarked),
        ],
      ),
    );
  }
}

class _BookmarkButton extends StatelessWidget {
  final bool isBookmarked;

  const _BookmarkButton({required this.isBookmarked});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<StoryDetailBloc>().add(
        const StoryDetailBookmarkToggled(),
      ),
      child: Container(
        width: 48.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.tagBorder, width: 1),
        ),
        child: Icon(
          isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          size: 22.sp,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }
}

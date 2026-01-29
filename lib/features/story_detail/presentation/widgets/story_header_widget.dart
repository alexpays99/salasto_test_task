import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_state.dart';

class StoryHeaderWidget extends StatelessWidget {
  final VoidCallback onShare;
  final VoidCallback onQuestToggle;
  final VoidCallback onBookmarkToggle;

  const StoryHeaderWidget({
    super.key,
    required this.onShare,
    required this.onQuestToggle,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            const _StoryImage(),
            Positioned(
              top: 57.h,
              left: 20.w,
              right: 20.w,
              child: _ImageTopBar(onShare: onShare),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24.h,
              child: Column(
                children: [
                  const _TitleOverlay(),
                  SizedBox(height: 10.h),
                  const _TagsRow(),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Text(
            AppStrings.storyDescription,
            style: AppTextStyles.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: Divider(
            height: 1,
            thickness: 1,
            color: AppColors.textPrimary.withValues(alpha: 0.1),
          ),
        ),
        SizedBox(height: 24.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          child: _QuestRow(
            onQuestToggle: onQuestToggle,
            onBookmarkToggle: onBookmarkToggle,
          ),
        ),
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
  final VoidCallback onShare;

  const _ImageTopBar({required this.onShare});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _CircleIconButton(
          assetPath: AppAssets.iconClose,
          onTap: () => Navigator.of(context).maybePop(),
        ),
        _CircleIconButton(
          assetPath: AppAssets.iconExport,
          onTap: onShare,
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback onTap;

  const _CircleIconButton({required this.assetPath, required this.onTap});

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
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 24.sp,
            height: 24.sp,
            colorFilter: const ColorFilter.mode(
              AppColors.textPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleOverlay extends StatelessWidget {
  const _TitleOverlay();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.softStar, width: 33.w, height: 44.h),
        SizedBox(height: 10.h),
        Text(
          AppStrings.storyTitle,
          style: AppTextStyles.storyTitle,
          textAlign: TextAlign.center,
        ),
      ],
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
  const _TagChip({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        child: SizedBox(
          height: 16.h,
          child: Center(
            child: Text(
              label,
              style: AppTextStyles.tag.copyWith(color: AppColors.surfaceCard),
            ),
          ),
        ),
      ),
    );
  }
}

class _DurationChip extends StatelessWidget {
  const _DurationChip({required this.duration});
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.textPrimary.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(42.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 4.h, right: 6.w, bottom: 4.h, left: 4.w),
        child: SizedBox(
          height: 16.h,
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
        ),
      ),
    );
  }
}

class _QuestRow extends StatelessWidget {
  final VoidCallback onQuestToggle;
  final VoidCallback onBookmarkToggle;

  const _QuestRow({
    required this.onQuestToggle,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryDetailBloc, StoryDetailState>(
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: _QuestButton(
              isInQuest: state.isInQuest,
              onTap: onQuestToggle,
            ),
          ),
          SizedBox(width: 12.w),
          _BookmarkButton(
            isBookmarked: state.isBookmarked,
            onTap: onBookmarkToggle,
          ),
        ],
      ),
    );
  }
}

class _QuestButton extends StatelessWidget {
  final bool isInQuest;
  final VoidCallback onTap;

  const _QuestButton({required this.isInQuest, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.surfaceUnderlayer,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isInQuest)
              Icon(
                Icons.check_circle,
                size: 20.sp,
                color: AppColors.textPrimary,
              )
            else
              SvgPicture.asset(
                AppAssets.iconAdd,
                width: 20.sp,
                height: 20.sp,
                colorFilter: const ColorFilter.mode(
                  AppColors.textPrimary,
                  BlendMode.srcIn,
                ),
              ),
            SizedBox(width: 8.w),
            Text(AppStrings.addToQuest, style: AppTextStyles.buttonSecondary),
          ],
        ),
      ),
    );
  }
}

class _BookmarkButton extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onTap;

  const _BookmarkButton({required this.isBookmarked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.surfaceUnderlayer,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: isBookmarked
              ? const Icon(Icons.bookmark)
              : SvgPicture.asset(
                  AppAssets.iconBookmark,
                  width: 20.sp,
                  height: 20.sp,
                  colorFilter: ColorFilter.mode(
                    AppColors.textPrimary,
                    BlendMode.srcIn,
                  ),
                ),
        ),
      ),
    );
  }
}

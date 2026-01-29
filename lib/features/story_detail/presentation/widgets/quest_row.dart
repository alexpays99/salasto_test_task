import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_state.dart';

class QuestRow extends StatelessWidget {
  final VoidCallback onQuestToggle;
  final VoidCallback onBookmarkToggle;

  const QuestRow({
    super.key,
    required this.onQuestToggle,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryDetailBloc, StoryDetailState>(
      builder: (context, state) => Row(
        children: [
          Expanded(
            child: QuestButton(
              isInQuest: state.isInQuest,
              onTap: onQuestToggle,
            ),
          ),
          SizedBox(width: 12.w),
          BookmarkButton(
            isBookmarked: state.isBookmarked,
            onTap: onBookmarkToggle,
          ),
        ],
      ),
    );
  }
}

class QuestButton extends StatelessWidget {
  final bool isInQuest;
  final VoidCallback onTap;

  const QuestButton({
    super.key,
    required this.isInQuest,
    required this.onTap,
  });

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

class BookmarkButton extends StatelessWidget {
  final bool isBookmarked;
  final VoidCallback onTap;

  const BookmarkButton({
    super.key,
    required this.isBookmarked,
    required this.onTap,
  });

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

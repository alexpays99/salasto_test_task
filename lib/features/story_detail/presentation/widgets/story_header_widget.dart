import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'image_top_bar.dart';
import 'quest_row.dart';
import 'story_image.dart';
import 'tags_row.dart';
import 'title_overlay.dart';

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
            const StoryImage(),
            Positioned(
              top: 57.h,
              left: 20.w,
              right: 20.w,
              child: ImageTopBar(onShare: onShare),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 24.h,
              child: Column(
                children: [
                  const TitleOverlay(),
                  SizedBox(height: 10.h),
                  const TagsRow(),
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
          child: QuestRow(
            onQuestToggle: onQuestToggle,
            onBookmarkToggle: onBookmarkToggle,
          ),
        ),
      ],
    );
  }
}

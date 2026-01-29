import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_event.dart';
import '../bloc/story_detail_state.dart';

class StoryHeaderWidget extends StatelessWidget {
  const StoryHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoryDetailBloc, StoryDetailState>(
      builder: (context, state) {
        if (state.story == null) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _TopBar(),
            SizedBox(height: 16.h),
            const _Illustration(),
            SizedBox(height: 20.h),
            Text(AppStrings.storyTitle, style: AppTextStyles.heading1),
          ],
        );
      },
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StoryDetailBloc, StoryDetailState, bool>(
      selector: (state) => state.isBookmarked,
      builder: (context, isBookmarked) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CircleIconButton(
              icon: Icons.close,
              onTap: () => Navigator.of(context).maybePop(),
            ),
            _CircleIconButton(
              icon: isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              onTap: () => context
                  .read<StoryDetailBloc>()
                  .add(const StoryDetailBookmarkToggled()),
            ),
          ],
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

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
        child: Icon(
          icon,
          color: AppColors.textPrimary,
          size: 22.sp,
        ),
      ),
    );
  }
}

class _Illustration extends StatelessWidget {
  const _Illustration();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        width: double.infinity,
        height: 200.h,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard,
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundLight,
              AppColors.surfaceCard,
            ],
          ),
        ),
        child: Image.asset(
          AppAssets.storyIllustration,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => Center(
            child: Icon(
              Icons.auto_stories,
              size: 64.sp,
              color: AppColors.primaryBlue,
            ),
          ),
        ),
      ),
    );
  }
}

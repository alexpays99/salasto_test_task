import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_event.dart';
import '../bloc/story_detail_state.dart';

class StoryActionsWidget extends StatelessWidget {
  const StoryActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _AddToQuestButton(),
        SizedBox(height: 16.h),
        const _MainActionButtons(),
      ],
    );
  }
}

class _AddToQuestButton extends StatelessWidget {
  const _AddToQuestButton();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StoryDetailBloc, StoryDetailState, bool>(
      selector: (state) => state.isInQuest,
      builder: (context, isInQuest) => SizedBox(
        width: double.infinity,
        height: 48.h,
        child: OutlinedButton.icon(
          onPressed: () => context
              .read<StoryDetailBloc>()
              .add(const StoryDetailQuestToggled()),
          icon: Icon(
            isInQuest ? Icons.check_circle : Icons.add_circle_outline,
            size: 20.sp,
            color: AppColors.accentGold,
          ),
          label: Text(
            AppStrings.addToQuest,
            style: AppTextStyles.buttonSecondary.copyWith(
              color: AppColors.accentGold,
            ),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: AppColors.accentGold.withValues(alpha: 0.5),
              width: 1.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ),
      ),
    );
  }
}

class _MainActionButtons extends StatelessWidget {
  const _MainActionButtons();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ActionButton(actionType: ActionType.listen),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: _ActionButton(actionType: ActionType.read),
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final ActionType actionType;

  const _ActionButton({required this.actionType});

  @override
  Widget build(BuildContext context) {
    final (label, icon, color) = switch (actionType) {
      ActionType.listen => (
          AppStrings.listen,
          Icons.headphones,
          AppColors.primaryBlue,
        ),
      ActionType.read => (
          AppStrings.read,
          Icons.menu_book,
          AppColors.primaryBlueLight,
        ),
    };

    return SizedBox(
      height: 52.h,
      child: ElevatedButton.icon(
        onPressed: () => context
            .read<StoryDetailBloc>()
            .add(StoryDetailActionPressed(actionType)),
        icon: Icon(icon, size: 20.sp),
        label: Text(label, style: AppTextStyles.buttonPrimary),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: AppColors.textPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          elevation: 4,
          shadowColor: color.withValues(alpha: 0.4),
        ),
      ),
    );
  }
}

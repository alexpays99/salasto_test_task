import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../domain/entities/story.dart';
import '../bloc/story_detail_bloc.dart';
import '../bloc/story_detail_event.dart';

/// Listen and Read stacked gradient buttons.
class StoryActionsWidget extends StatelessWidget {
  const StoryActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ActionButton(actionType: ActionType.listen),
        _ActionButton(actionType: ActionType.read),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final ActionType actionType;

  const _ActionButton({required this.actionType});

  @override
  Widget build(BuildContext context) {
    final (label, icon, gradientColors, borderRadius) = switch (actionType) {
      ActionType.listen => (
          AppStrings.listen,
          Icons.volume_up_outlined,
          const [AppColors.listenGradientStart, AppColors.listenGradientEnd],
          BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
      ActionType.read => (
          AppStrings.read,
          Icons.menu_book_outlined,
          const [AppColors.readGradientStart, AppColors.readGradientEnd],
          BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
    };

    return GestureDetector(
      onTap: () => context
          .read<StoryDetailBloc>()
          .add(StoryDetailActionPressed(actionType)),
      child: Container(
        width: double.infinity,
        height: 64.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: gradientColors,
          ),
          borderRadius: borderRadius,
          border: Border.all(
            color: AppColors.borderGradientStart,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24.sp, color: AppColors.textPrimary),
            SizedBox(width: 8.w),
            Text(label, style: AppTextStyles.buttonXL),
          ],
        ),
      ),
    );
  }
}

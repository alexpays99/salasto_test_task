import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/localization/app_strings.dart';
import '../../../core/theme/app_text_styles.dart';
import 'bloc/story_detail_bloc.dart';
import 'bloc/story_detail_event.dart';
import 'bloc/story_detail_state.dart';
import 'widgets/lessons_learnt_widget.dart';
import 'widgets/story_actions_widget.dart';
import 'widgets/story_header_widget.dart';
import 'widgets/story_tags_widget.dart';

class StoryDetailPage extends StatelessWidget {
  const StoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StoryDetailBloc()..add(const StoryDetailLoaded()),
      child: const _StoryDetailView(),
    );
  }
}

class _StoryDetailView extends StatelessWidget {
  const _StoryDetailView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundDark,
              AppColors.backgroundMedium,
            ],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<StoryDetailBloc, StoryDetailState>(
            buildWhen: (prev, curr) => prev.status != curr.status,
            builder: (context, state) => switch (state.status) {
              StoryDetailStatus.initial => const Center(
                  child: CircularProgressIndicator(),
                ),
              StoryDetailStatus.error => Center(
                  child: Text(
                    'Something went wrong',
                    style: AppTextStyles.bodyLarge,
                  ),
                ),
              StoryDetailStatus.loaded => const _StoryDetailContent(),
            },
          ),
        ),
      ),
    );
  }
}

class _StoryDetailContent extends StatelessWidget {
  const _StoryDetailContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StoryHeaderWidget(),
          SizedBox(height: 12.h),
          const StoryTagsWidget(),
          SizedBox(height: 16.h),
          const _StoryDescription(),
          SizedBox(height: 24.h),
          const StoryActionsWidget(),
          SizedBox(height: 32.h),
          const LessonsLearntWidget(),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }
}

class _StoryDescription extends StatelessWidget {
  const _StoryDescription();

  @override
  Widget build(BuildContext context) {
    return Text(
      AppStrings.storyDescription,
      style: AppTextStyles.bodyMedium,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import 'bloc/story_detail_bloc.dart';
import 'bloc/story_detail_event.dart';
import 'bloc/story_detail_state.dart';
import 'widgets/lessons_learnt_widget.dart';
import 'widgets/story_actions_widget.dart';
import 'widgets/story_header_widget.dart';

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
      backgroundColor: AppColors.background,
      body: BlocBuilder<StoryDetailBloc, StoryDetailState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) => switch (state.status) {
          StoryDetailStatus.initial => const Center(
            child: CircularProgressIndicator(),
          ),
          StoryDetailStatus.error => Center(
            child: Text('Something went wrong', style: AppTextStyles.bodyLarge),
          ),
          StoryDetailStatus.loaded => const _StoryDetailContent(),
        },
      ),
    );
  }
}

class _StoryDetailContent extends StatelessWidget {
  const _StoryDetailContent();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const StoryHeaderWidget(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 16.h),
                const StoryActionsWidget(),
                SizedBox(height: 16.h),
                const LessonsLearntWidget(),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

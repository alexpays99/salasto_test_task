import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/localization/app_strings.dart';
import '../../data/models/story_model.dart';
import '../../domain/entities/story.dart';
import 'story_detail_event.dart';
import 'story_detail_state.dart';

class StoryDetailBloc extends Bloc<StoryDetailEvent, StoryDetailState> {
  StoryDetailBloc() : super(const StoryDetailState()) {
    on<StoryDetailLoaded>(_onLoaded);
    on<StoryDetailBookmarkToggled>(_onBookmarkToggled);
    on<StoryDetailQuestToggled>(_onQuestToggled);
    on<StoryDetailActionPressed>(_onActionPressed);
    on<StoryDetailSharePressed>(_onSharePressed);
  }

  void _onLoaded(StoryDetailLoaded event, Emitter<StoryDetailState> emit) {
    emit(
      state.copyWith(
        status: StoryDetailStatus.loaded,
        story: StoryModel.mockStory,
      ),
    );
  }

  void _onBookmarkToggled(
    StoryDetailBookmarkToggled event,
    Emitter<StoryDetailState> emit,
  ) {
    final story = state.story;
    if (story == null) return;

    emit(
      state.copyWith(story: story.copyWith(isBookmarked: !story.isBookmarked)),
    );
  }

  void _onQuestToggled(
    StoryDetailQuestToggled event,
    Emitter<StoryDetailState> emit,
  ) {
    final story = state.story;
    if (story == null) return;

    emit(state.copyWith(story: story.copyWith(isInQuest: !story.isInQuest)));
  }

  void _onActionPressed(
    StoryDetailActionPressed event,
    Emitter<StoryDetailState> emit,
  ) {
    switch (event.actionType) {
      case ActionType.listen:
        break;
      case ActionType.read:
        break;
    }
  }

  Future<void> _onSharePressed(
    StoryDetailSharePressed event,
    Emitter<StoryDetailState> emit,
  ) async {
    final title = AppStrings.storyTitle.replaceAll('\n', ' ');
    await Share.share('$title - ${AppStrings.appTitle}');
  }
}

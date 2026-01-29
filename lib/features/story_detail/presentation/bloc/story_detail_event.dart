import 'package:equatable/equatable.dart';

import '../../domain/entities/story.dart';

sealed class StoryDetailEvent extends Equatable {
  const StoryDetailEvent();

  @override
  List<Object?> get props => [];
}

final class StoryDetailLoaded extends StoryDetailEvent {
  const StoryDetailLoaded();
}

final class StoryDetailBookmarkToggled extends StoryDetailEvent {
  const StoryDetailBookmarkToggled();
}

final class StoryDetailQuestToggled extends StoryDetailEvent {
  const StoryDetailQuestToggled();
}

final class StoryDetailSharePressed extends StoryDetailEvent {
  const StoryDetailSharePressed();
}

final class StoryDetailActionPressed extends StoryDetailEvent {
  final ActionType actionType;

  const StoryDetailActionPressed(this.actionType);

  @override
  List<Object?> get props => [actionType];
}

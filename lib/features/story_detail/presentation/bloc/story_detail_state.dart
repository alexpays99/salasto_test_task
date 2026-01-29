import 'package:equatable/equatable.dart';

import '../../domain/entities/story.dart';

enum StoryDetailStatus { initial, loaded, error }

final class StoryDetailState extends Equatable {
  final StoryDetailStatus status;
  final Story? story;

  const StoryDetailState({
    this.status = StoryDetailStatus.initial,
    this.story,
  });

  bool get isBookmarked => story?.isBookmarked ?? false;
  bool get isInQuest => story?.isInQuest ?? false;
  bool get isLessonsUnlocked => story?.isLessonsUnlocked ?? false;

  StoryDetailState copyWith({
    StoryDetailStatus? status,
    Story? story,
  }) =>
      StoryDetailState(
        status: status ?? this.status,
        story: story ?? this.story,
      );

  @override
  List<Object?> get props => [status, story];
}

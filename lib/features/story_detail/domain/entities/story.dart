import 'package:equatable/equatable.dart';

enum StoryTag { wisdom, courage, pirate }

enum ActionType { listen, read }

final class Story extends Equatable {
  final String id;
  final String title;
  final String description;
  final String illustrationPath;
  final List<StoryTag> tags;
  final bool isBookmarked;
  final bool isInQuest;
  final bool isLessonsUnlocked;

  const Story({
    required this.id,
    required this.title,
    required this.description,
    required this.illustrationPath,
    required this.tags,
    this.isBookmarked = false,
    this.isInQuest = false,
    this.isLessonsUnlocked = false,
  });

  Story copyWith({
    bool? isBookmarked,
    bool? isInQuest,
    bool? isLessonsUnlocked,
  }) =>
      Story(
        id: id,
        title: title,
        description: description,
        illustrationPath: illustrationPath,
        tags: tags,
        isBookmarked: isBookmarked ?? this.isBookmarked,
        isInQuest: isInQuest ?? this.isInQuest,
        isLessonsUnlocked: isLessonsUnlocked ?? this.isLessonsUnlocked,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        illustrationPath,
        tags,
        isBookmarked,
        isInQuest,
        isLessonsUnlocked,
      ];
}

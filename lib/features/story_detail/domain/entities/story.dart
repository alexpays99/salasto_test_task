import 'package:equatable/equatable.dart';

enum StoryTag { wisdom, courage }

enum ActionType { listen, read }

final class Story extends Equatable {
  final String id;
  final String title;
  final String description;
  final String illustrationPath;
  final List<StoryTag> tags;
  final String duration;
  final bool isBookmarked;
  final bool isInQuest;
  const Story({
    required this.id,
    required this.title,
    required this.description,
    required this.illustrationPath,
    required this.tags,
    required this.duration,
    this.isBookmarked = false,
    this.isInQuest = false,
  });

  Story copyWith({bool? isBookmarked, bool? isInQuest}) => Story(
    id: id,
    title: title,
    description: description,
    illustrationPath: illustrationPath,
    tags: tags,
    duration: duration,
    isBookmarked: isBookmarked ?? this.isBookmarked,
    isInQuest: isInQuest ?? this.isInQuest,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    description,
    illustrationPath,
    tags,
    duration,
    isBookmarked,
    isInQuest,
  ];
}

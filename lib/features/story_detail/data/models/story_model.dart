import '../../domain/entities/story.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/strings/app_strings.dart';

abstract final class StoryModel {
  static Story get mockStory => const Story(
        id: '1',
        title: AppStrings.storyTitle,
        description: AppStrings.storyDescription,
        illustrationPath: AppAssets.storyImage,
        tags: [StoryTag.wisdom, StoryTag.courage],
        duration: AppStrings.duration,
      );
}

import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';

class StoryImage extends StatelessWidget {
  const StoryImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppAssets.storyImage,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/strings/app_strings.dart';
import '../../../../core/theme/app_text_styles.dart';

class TitleOverlay extends StatelessWidget {
  const TitleOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppAssets.softStar, width: 33.w, height: 44.h),
        SizedBox(height: 10.h),
        Text(
          AppStrings.storyTitle,
          style: AppTextStyles.storyTitle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

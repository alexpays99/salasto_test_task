import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/localization/app_strings.dart';
import 'core/theme/app_theme.dart';
import 'features/story_detail/presentation/story_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: AppStrings.appTitle,
        theme: AppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        home: const StoryDetailPage(),
      ),
    );
  }
}

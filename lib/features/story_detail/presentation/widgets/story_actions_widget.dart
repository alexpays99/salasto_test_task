import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/story.dart';
import 'action_button.dart';

/// Listen and Read stacked gradient buttons.
class StoryActionsWidget extends StatelessWidget {
  final ValueChanged<ActionType> onActionPressed;

  const StoryActionsWidget({super.key, required this.onActionPressed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActionButton(
          actionType: ActionType.listen,
          onTap: () => onActionPressed(ActionType.listen),
        ),
        SizedBox(height: 1.h),
        ActionButton(
          actionType: ActionType.read,
          onTap: () => onActionPressed(ActionType.read),
        ),
      ],
    );
  }
}

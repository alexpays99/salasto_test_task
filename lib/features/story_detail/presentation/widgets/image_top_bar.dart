import 'package:flutter/material.dart';

import '../../../../core/constants/app_assets.dart';
import 'circle_icon_button.dart';

class ImageTopBar extends StatelessWidget {
  final VoidCallback onShare;

  const ImageTopBar({super.key, required this.onShare});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleIconButton(
          assetPath: AppAssets.iconClose,
          onTap: () => Navigator.of(context).maybePop(),
        ),
        CircleIconButton(
          assetPath: AppAssets.iconExport,
          onTap: onShare,
        ),
      ],
    );
  }
}

import 'dart:ui';

abstract final class AppColors {
  // Background
  static const background = Color(0xFF180B40);

  // Surface
  static const surfaceCard = Color(0xFF120831);
  static const surfaceOverlay = Color(0x66000000);
  static const surfaceUnderlayer = Color(0xFF24174A);

  // Gradients — Listen button
  static const listenGradientStart = Color(0xFF9159DB);
  static const listenGradientEnd = Color(0xFF5959DB);

  // Gradients — Read button
  static const readGradientStart = Color(0xFF05C4E1);
  static const readGradientEnd = Color(0xFF0662CB);

  // Border gradient (shared)
  static const borderGradientStart = Color(0x4DFFFFFF);
  static const borderGradientEnd = Color(0x00FFFFFF);

  // Accent
  static const exodusFruit = Color(0xFF5959DB);

  // Text
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFD0CED6);
  static const textTertiary = Color(0xFF8B859F);

  // Misc
  static const shadowDark = Color(0x59000000);
  static const transparent = Color(0x00000000);
}

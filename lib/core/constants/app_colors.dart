import 'dart:ui';

abstract final class AppColors {
  // Background
  static const background = Color(0xFF180B40);

  // Surface
  static const surfaceCard = Color(0xFF120831);
  static const surfaceOverlay = Color(0x66000000);

  // Gradients — Listen button
  static const listenGradientStart = Color(0xFF9159DB);
  static const listenGradientEnd = Color(0xFF5959DB);

  // Gradients — Read button
  static const readGradientStart = Color(0xFF05C4E1);
  static const readGradientEnd = Color(0xFF0662CB);

  // Gradients — Image overlay
  static const imageOverlayStart = Color(0x00180B40);
  static const imageOverlayEnd = Color(0xFF180B40);

  // Border gradient (shared)
  static const borderGradientStart = Color(0x4DFFFFFF);
  static const borderGradientEnd = Color(0x00FFFFFF);

  // Inset shadows
  static const insetShadowTop = Color(0x1A10031B);
  static const insetShadowRing = Color(0x3310031B);

  // Accent
  static const exodusFruit = Color(0xFF5959DB);
  static const accentGold = Color(0xFFDAA520);

  // Text
  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0B0C3);
  static const textTertiary = Color(0xFF8B859F);

  // Tags
  static const tagBackground = Color(0x33FFFFFF);
  static const tagBorder = Color(0x4DFFFFFF);

  // Misc
  static const divider = Color(0x1AFFFFFF);
  static const shadowDark = Color(0x59000000);
  static const transparent = Color(0x00000000);
}

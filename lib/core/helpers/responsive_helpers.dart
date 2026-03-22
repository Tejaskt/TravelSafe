import 'package:flutter/material.dart';

/// Enhanced Responsive Helper Class (Optimized for TravelSafe)
///
/// Provides intelligent responsive scaling that works across all device sizes:
/// - Mobile phones (< 600dp width)
/// - Tablets (600-840dp width)
/// - Desktop/Foldables (> 840dp width)
///
/// Key Features:
/// ✓ Smart scaling caps prevent UI over-stretching on large screens
/// ✓ User-friendly layout that looks good on all devices
/// ✓ Follows Material Design responsive breakpoints
/// ✓ Backward compatible with existing code (w, h, sp methods maintained)
///
/// Usage:
/// ```dart
/// double padding = ResponsiveHelpers.w(context, 16);        // Width scaling
/// double fontSize = ResponsiveHelpers.sp(context, 18);      // Font scaling
/// EdgeInsets pad = ResponsiveHelpers.screenPadding(context); // Screen padding
/// bool isTablet = ResponsiveHelpers.isTablet(context);      // Device check
/// ```

class ResponsiveHelpers {
  ResponsiveHelpers._();

  // ─── Breakpoint Constants ──────────────────────────────────────────────
  static const double tabletBreakpoint = 600.0;
  static const double desktopBreakpoint = 840.0;
  static const double baseWidth = 400.0;
  static const double baseHeight = 850.0;

  // ─── Scale Capping Constants (Prevents over-enlargement) ───────────────
  static const double fontScaleMin = 0.85;
  static const double fontScaleMax = 1.5;
  static const double elementScaleMin = 0.8;
  static const double elementScaleMax = 1.3;
  static const double landscapeScaleCap = 1.2;

  // ──────────────────────────────────────────────────────────────────────────
  // DEVICE DETECTION
  // ──────────────────────────────────────────────────────────────────────────

  static Size mediaQuery(BuildContext context) =>
      MediaQuery.of(context).size;

  /// Check if device is tablet (width >= 600dp)
  static bool isTablet(BuildContext context) =>
      mediaQuery(context).shortestSide >= tabletBreakpoint;

  /// Check if device is desktop/large tablet (width >= 840dp)
  static bool isDesktop(BuildContext context) =>
      mediaQuery(context).width >= desktopBreakpoint;

  /// Check if device is in landscape orientation
  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  /// Check if device is in portrait orientation
  static bool isPortrait(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.portrait;

  /// Check if device is tablet in landscape mode
  static bool isTabletLandscape(BuildContext context) =>
      isTablet(context) && isLandscape(context);

  /// Check if device is tablet in portrait mode
  static bool isTabletPortrait(BuildContext context) =>
      isTablet(context) && !isLandscape(context);

  // ─── Width scaling with intelligent capping ─────────────────────────────
  /// Scales width/padding based on screen width.
  /// On tablets: applies caps to prevent over-enlargement
  /// On mobile: scales linearly without caps
  ///
  /// Usage: `padding: EdgeInsets.all(ResponsiveHelpers.w(context, 16))`
  static double w(BuildContext context, double px) {
    final width = mediaQuery(context).width;
    final scale = width / baseWidth;

    if (isDesktop(context)) {
      // Desktop: aggressive capping to keep UI readable
      return px * scale.clamp(elementScaleMin, elementScaleMax);
    } else if (isTabletLandscape(context)) {
      // Landscape tablet: cap to prevent excessive width
      return px * scale.clamp(elementScaleMin, landscapeScaleCap);
    } else if (isTablet(context)) {
      // Portrait tablet: moderate capping
      return px * scale.clamp(elementScaleMin, elementScaleMax);
    } else {
      // Mobile: scale freely
      return px * scale;
    }
  }

  // ─── Height scaling with intelligent capping ─────────────────────────────
  /// Scales height based on screen height with similar capping logic as w()
  ///
  /// Usage: `height: ResponsiveHelpers.h(context, 200)`
  static double h(BuildContext context, double px) {
    final height = mediaQuery(context).height;
    final scale = height / baseHeight;

    if (isDesktop(context)) {
      return px * scale.clamp(elementScaleMin, elementScaleMax);
    } else if (isTabletLandscape(context)) {
      return px * scale.clamp(elementScaleMin, landscapeScaleCap);
    } else if (isTablet(context)) {
      return px * scale.clamp(elementScaleMin, elementScaleMax);
    } else {
      return px * scale;
    }
  }

  // ─── Font size scaling with aggressive capping ──────────────────────────
  /// Scales font size with stricter caps to ensure text remains readable
  /// and proportional across all devices.
  ///
  /// Usage: `fontSize: ResponsiveHelpers.sp(context, 16)`
  static double sp(BuildContext context, double px) {
    final width = mediaQuery(context).width;
    final scale = width / baseWidth;

    if (isDesktop(context)) {
      // Desktop: cap font growth to maintain readability
      return px * scale.clamp(fontScaleMin, fontScaleMax);
    } else if (isTabletLandscape(context)) {
      // Landscape tablet: aggressive capping prevents oversized text
      return px * scale.clamp(fontScaleMin, landscapeScaleCap);
    } else if (isTablet(context)) {
      // Portrait tablet: cap font to max 1.5x
      return px * scale.clamp(fontScaleMin, fontScaleMax);
    } else {
      // Mobile: scale freely
      return px * scale;
    }
  }

  // ─── Screen padding with adaptive logic ────────────────────────────────
  /// Returns adaptive padding based on device type and orientation.
  /// Desktop/large tablets: generous percentage-based padding
  /// Tablets: scaled padding using w() and h()
  /// Mobile: scaled padding using w() and h()
  ///
  /// Usage: `padding: ResponsiveHelpers.screenPadding(context)`
  static EdgeInsets screenPadding(BuildContext context) {
    if (isDesktop(context)) {
      // Desktop: percentage-based padding with clamps
      final baseWidth = mediaQuery(context).width;
      return EdgeInsets.symmetric(
        horizontal: (baseWidth * 0.08).clamp(40.0, 80.0),
        vertical: (mediaQuery(context).height * 0.03).clamp(20.0, 40.0),
      );
    } else if (isTabletLandscape(context)) {
      // Landscape tablet: balanced padding
      return EdgeInsets.symmetric(
        horizontal: w(context, 24),
        vertical: h(context, 12),
      );
    } else if (isTablet(context)) {
      // Portrait tablet: slightly larger padding
      return EdgeInsets.symmetric(
        horizontal: w(context, 24),
        vertical: h(context, 16),
      );
    } else {
      // Mobile: compact padding
      return EdgeInsets.symmetric(
        horizontal: w(context, 16),
        vertical: h(context, 16),
      );
    }
  }

  // ──────────────────────────────────────────────────────────────────────────
  // ADDITIONAL HELPERS
  // ──────────────────────────────────────────────────────────────────────────

  /// Get max content width to prevent excessive stretching on large screens
  static double maxContentWidth(BuildContext context) {
    final screenW = mediaQuery(context).width;
    if (isDesktop(context)) {
      return screenW * 0.85; // Use 85% of screen on desktop
    } else if (isTablet(context)) {
      return screenW * 0.9; // Use 90% of screen on tablet
    }
    return screenW; // Use full width on mobile
  }

  /// Get recommended number of columns for grid layouts
  static int gridColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTabletLandscape(context)) return 3;
    if (isTablet(context)) return 2;
    return 2;
  }
}
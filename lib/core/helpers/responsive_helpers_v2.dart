import 'package:flutter/material.dart';

/// Enhanced Responsive Helper Class
/// 
/// This class provides a comprehensive responsive design system that:
/// - Scales UI based on screen dimensions
/// - Applies intelligent capping on large screens (user-friendly)
/// - Uses industry-standard breakpoints (mobile, tablet, desktop)
/// - Supports max-width constraints to prevent over-stretching
/// - Balances scalability with consistent design aesthetics
/// 
/// Industry Reference: Material Design 3, Flutter Adaptive UI patterns
/// 
/// Usage Example:
/// ```dart
/// double padding = ResponsiveHelpers.scaleWidth(context, 16);
/// double fontSize = ResponsiveHelpers.scaledFont(context, 18);
/// double maxWidth = ResponsiveHelpers.maxContentWidth(context);
/// DeviceType device = ResponsiveHelpers.deviceType(context);
/// ```

class ResponsiveHelpers {
  ResponsiveHelpers._();

  // ─── Device Breakpoints (Material Design Standard) ──────────────────────
  /// Standard breakpoints used in responsive design
  /// Based on Material Design 3 specifications
  static const double MOBILE_BREAKPOINT = 600;
  static const double TABLET_BREAKPOINT = 840;
  static const double DESKTOP_BREAKPOINT = 1440;

  // ─── Base Reference Dimensions ──────────────────────────────────────────
  /// Reference device for scaling calculations
  /// 400pt width is typical for older flagship phones (iPhone SE, etc.)
  /// 850pt height is typical small phone height in portrait
  static const double BASE_WIDTH = 400.0;
  static const double BASE_HEIGHT = 850.0;

  // ─── Max Constraints (Prevents UI over-stretching) ──────────────────────
  /// Maximum width constraint for content on tablets/large screens
  /// Prevents UI from looking weird with excessive spacing
  static const double TABLET_MAX_WIDTH = 800;
  static const double DESKTOP_MAX_WIDTH = 1200;

  // ─── Scale Caps (Prevents excessive scaling) ────────────────────────────
  /// Font scaling never goes below 0.85x or above 1.6x on tablets
  /// Ensures readable text without distortion
  static const double FONT_SCALE_MIN = 0.85;
  static const double FONT_SCALE_MAX = 1.6;

  /// Element scaling (width, height, padding) capped between 0.8x–1.4x
  /// Prevents elements from becoming disproportionately large
  static const double ELEMENT_SCALE_MIN = 0.8;
  static const double ELEMENT_SCALE_MAX = 1.4;

  // ─── Landscape Mode Scale Cap (Prevents over-enlargement) ───────────────
  /// On landscape tablets, scale is capped to prevent excessive growth
  static const double LANDSCAPE_SCALE_CAP = 1.3;

  // ──────────────────────────────────────────────────────────────────────────
  // DEVICE DETECTION
  // ──────────────────────────────────────────────────────────────────────────

  static Size mediaQuery(BuildContext context) =>
      MediaQuery.of(context).size;

  static double screenWidth(BuildContext context) =>
      mediaQuery(context).width;

  static double screenHeight(BuildContext context) =>
      mediaQuery(context).height;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  /// Detect device type (Mobile, Tablet, or Desktop)
  static DeviceType deviceType(BuildContext context) {
    final width = screenWidth(context);
    if (width < MOBILE_BREAKPOINT) return DeviceType.mobile;
    if (width < TABLET_BREAKPOINT) return DeviceType.tablet;
    return DeviceType.desktop;
  }

  static bool isMobile(BuildContext context) =>
      deviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      deviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      deviceType(context) == DeviceType.desktop;

  static bool isLandscape(BuildContext context) =>
      orientation(context) == Orientation.landscape;

  static bool isPortrait(BuildContext context) =>
      orientation(context) == Orientation.portrait;

  static bool isTabletLandscape(BuildContext context) =>
      isTablet(context) && isLandscape(context);

  static bool isTabletPortrait(BuildContext context) =>
      isTablet(context) && isPortrait(context);

  // ──────────────────────────────────────────────────────────────────────────
  // RESPONSIVE SCALING (WITH SMART CAPS)
  // ──────────────────────────────────────────────────────────────────────────

  /// Scale width/padding based on screen width
  /// On tablets: scales with cap to prevent over-enlargement
  /// On mobile: scales linearly
  /// 
  /// Usage: `var padding = ResponsiveHelpers.scaleWidth(context, 16);`
  static double scaleWidth(BuildContext context, double baseValue) {
    final width = screenWidth(context);
    final scale = width / BASE_WIDTH;

    if (isDesktop(context)) {
      // Desktop: cap scaling at ELEMENT_SCALE_MAX (1.4x)
      return baseValue * scale.clamp(ELEMENT_SCALE_MIN, ELEMENT_SCALE_MAX);
    } else if (isTabletLandscape(context)) {
      // Landscape tablet: cap at LANDSCAPE_SCALE_CAP (1.3x)
      return baseValue * scale.clamp(ELEMENT_SCALE_MIN, LANDSCAPE_SCALE_CAP);
    } else if (isTablet(context)) {
      // Portrait tablet: cap at ELEMENT_SCALE_MAX (1.4x)
      return baseValue * scale.clamp(ELEMENT_SCALE_MIN, ELEMENT_SCALE_MAX);
    } else {
      // Mobile: scale freely (no cap)
      return baseValue * scale;
    }
  }

  /// Scale height based on screen height
  /// Mirrors scaleWidth logic for vertical dimensions
  static double scaleHeight(BuildContext context, double baseValue) {
    final height = screenHeight(context);
    final scale = height / BASE_HEIGHT;

    if (isDesktop(context)) {
      return baseValue * scale.clamp(ELEMENT_SCALE_MIN, ELEMENT_SCALE_MAX);
    } else if (isTabletLandscape(context)) {
      return baseValue * scale.clamp(ELEMENT_SCALE_MIN, LANDSCAPE_SCALE_CAP);
    } else if (isTablet(context)) {
      return baseValue * scale.clamp(ELEMENT_SCALE_MIN, ELEMENT_SCALE_MAX);
    } else {
      return baseValue * scale;
    }
  }

  /// Scale font size with intelligent capping
  /// Ensures text remains readable and proportional on all devices
  /// 
  /// Usage: `var fontSize = ResponsiveHelpers.scaledFont(context, 18);`
  static double scaledFont(BuildContext context, double baseFontSize) {
    final width = screenWidth(context);
    final scale = width / BASE_WIDTH;

    if (isDesktop(context)) {
      // Desktop: cap font scaling at FONT_SCALE_MAX
      return baseFontSize * scale.clamp(FONT_SCALE_MIN, FONT_SCALE_MAX);
    } else if (isTabletLandscape(context)) {
      // Landscape tablet: aggressive capping to prevent oversized fonts
      return baseFontSize * scale.clamp(FONT_SCALE_MIN, LANDSCAPE_SCALE_CAP);
    } else if (isTablet(context)) {
      // Portrait tablet: cap font at FONT_SCALE_MAX
      return baseFontSize * scale.clamp(FONT_SCALE_MIN, FONT_SCALE_MAX);
    } else {
      // Mobile: scale freely
      return baseFontSize * scale;
    }
  }

  // ──────────────────────────────────────────────────────────────────────────
  // ADAPTIVE PADDING & SPACING
  // ──────────────────────────────────────────────────────────────────────────

  /// Get adaptive screen padding based on device and orientation
  /// 
  /// Usage: `padding: ResponsiveHelpers.screenPadding(context)`
  static EdgeInsets screenPadding(BuildContext context) {
    if (isDesktop(context)) {
      // Desktop: generous padding with percentage-based sizing
      final baseWidth = screenWidth(context);
      return EdgeInsets.symmetric(
        horizontal: (baseWidth * 0.08).clamp(40, 100),
        vertical: (screenHeight(context) * 0.04).clamp(30, 60),
      );
    } else if (isTabletLandscape(context)) {
      // Landscape tablet: balanced padding
      return EdgeInsets.symmetric(
        horizontal: scaleWidth(context, 24),
        vertical: scaleHeight(context, 16),
      );
    } else if (isTablet(context)) {
      // Portrait tablet: slightly larger padding than mobile
      return EdgeInsets.symmetric(
        horizontal: scaleWidth(context, 24),
        vertical: scaleHeight(context, 20),
      );
    } else {
      // Mobile: compact padding
      return EdgeInsets.symmetric(
        horizontal: scaleWidth(context, 16),
        vertical: scaleHeight(context, 16),
      );
    }
  }

  /// Get adaptive horizontal padding for lists/scrollable content
  static EdgeInsets horizontalPadding(BuildContext context,
      {double mobileValue = 16, double tabletValue = 24}) {
    return EdgeInsets.symmetric(
      horizontal: isTablet(context)
          ? scaleWidth(context, tabletValue)
          : scaleWidth(context, mobileValue),
    );
  }

  /// Get adaptive vertical spacing between elements
  static SizedBox verticalSpacing(BuildContext context,
      {double mobileValue = 12, double tabletValue = 16}) {
    final spacing = isTablet(context)
        ? scaleHeight(context, tabletValue)
        : scaleHeight(context, mobileValue);
    return SizedBox(height: spacing);
  }

  /// Get adaptive horizontal spacing between elements
  static SizedBox horizontalSpacing(BuildContext context,
      {double mobileValue = 12, double tabletValue = 16}) {
    final spacing = isTablet(context)
        ? scaleWidth(context, tabletValue)
        : scaleWidth(context, mobileValue);
    return SizedBox(width: spacing);
  }

  // ──────────────────────────────────────────────────────────────────────────
  // MAX-WIDTH CONSTRAINTS (Prevents UI over-stretching)
  // ──────────────────────────────────────────────────────────────────────────

  /// Get the maximum content width for responsive containers
  /// Prevents content from stretching too wide on large screens
  /// 
  /// Usage: `width: ResponsiveHelpers.maxContentWidth(context)`
  static double maxContentWidth(BuildContext context) {
    final screenW = screenWidth(context);

    if (isDesktop(context)) {
      return DESKTOP_MAX_WIDTH.clamp(400, screenW);
    } else if (isTablet(context)) {
      return TABLET_MAX_WIDTH.clamp(300, screenW);
    } else {
      return screenW; // Mobile: use full width
    }
  }

  /// Get maximum height for adaptive containers
  static double maxContentHeight(BuildContext context) {
    if (isDesktop(context)) {
      return screenHeight(context) * 0.85;
    } else if (isTablet(context)) {
      return screenHeight(context) * 0.9;
    } else {
      return screenHeight(context);
    }
  }

  // ──────────────────────────────────────────────────────────────────────────
  // GRID & COLUMN HELPERS (For responsive layouts)
  // ──────────────────────────────────────────────────────────────────────────

  /// Get recommended number of columns for grid layouts
  /// 
  /// Usage: `gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: ResponsiveHelpers.gridColumns(context))`
  static int gridColumns(BuildContext context) {
    if (isDesktop(context)) return 4;
    if (isTabletLandscape(context)) return 3;
    if (isTablet(context)) return 2;
    return 2;
  }

  /// Get aspect ratio for grid items based on device
  static double gridAspectRatio(BuildContext context) {
    if (isDesktop(context)) return 1.2;
    if (isTablet(context)) return 0.85;
    return 0.9;
  }

  // ──────────────────────────────────────────────────────────────────────────
  // TYPOGRAPHY HELPERS
  // ──────────────────────────────────────────────────────────────────────────

  /// Get responsive headline (large heading) size
  static double headlineLarge(BuildContext context) =>
      scaledFont(context, 32);

  /// Get responsive headline (medium heading) size
  static double headlineMedium(BuildContext context) =>
      scaledFont(context, 28);

  /// Get responsive headline (small heading) size
  static double headlineSmall(BuildContext context) =>
      scaledFont(context, 24);

  /// Get responsive title size
  static double titleLarge(BuildContext context) =>
      scaledFont(context, 22);

  /// Get responsive body text size
  static double bodyLarge(BuildContext context) =>
      scaledFont(context, 16);

  /// Get responsive small text size
  static double bodySmall(BuildContext context) =>
      scaledFont(context, 14);

  // ──────────────────────────────────────────────────────────────────────────
  // SAFE AREA & NOTCH HANDLING
  // ──────────────────────────────────────────────────────────────────────────

  /// Get safe area padding (accounts for notch, status bar, etc.)
  static EdgeInsets getSafeAreaPadding(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return EdgeInsets.only(
      top: mediaQuery.padding.top,
      bottom: mediaQuery.padding.bottom,
      left: mediaQuery.padding.left,
      right: mediaQuery.padding.right,
    );
  }

  /// Check if device has notch/cutout
  static bool hasNotch(BuildContext context) {
    return MediaQuery.of(context).padding.top > 24;
  }
}

// ──────────────────────────────────────────────────────────────────────────
// DEVICE TYPE ENUM
// ──────────────────────────────────────────────────────────────────────────

/// Enum for device classification
enum DeviceType {
  mobile,
  tablet,
  desktop,
}


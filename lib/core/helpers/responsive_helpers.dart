import 'package:flutter/material.dart';

class ResponsiveHelpers {
  ResponsiveHelpers._();

  static Size mediaQuery(BuildContext context) =>
      MediaQuery.of(context).size;

  static bool isTablet(BuildContext context) =>
      mediaQuery(context).shortestSide >= 600;

  static bool isLandscape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isTabletLandscape(BuildContext context) =>
      isTablet(context) && isLandscape(context);

  //table portrait
  static bool isTabletPortrait(BuildContext context) =>
      isTablet(context) && !isLandscape(context);

  // ─── Width scaling ─────────────────────────────
  static double w(BuildContext context, double px) {
    const baseWidth = 375.0;
    final side = isTablet(context)
        ? mediaQuery(context).shortestSide
        : mediaQuery(context).width;
    return px * (side / baseWidth);
  }

  // ─── Height scaling ────────────────────────────
  static double h(BuildContext context, double px) {
    const baseHeight = 812.0;
    final side = isTablet(context)
        ? mediaQuery(context).shortestSide
        : mediaQuery(context).height;
    return px * (side / baseHeight);
  }

  // ─── Font / Icon scaling ───────────────────────
  static double sp(BuildContext context, double px) {
    const baseWidth = 375.0;
    final side = isTablet(context)
        ? mediaQuery(context).shortestSide
        : mediaQuery(context).width;
    final scale = side / baseWidth;
    final cappedScale = isTablet(context) ? scale.clamp(0.0, 1.3) : scale;
    return px * cappedScale;
  }

  // ─── Screen padding ────────────────────────────
  static EdgeInsets screenPadding(BuildContext context) {
    return isTablet(context)
        ? EdgeInsets.symmetric(
      horizontal: mediaQuery(context).shortestSide * 0.05,
      vertical: mediaQuery(context).shortestSide * 0.02,
    )
        : EdgeInsets.symmetric(
      horizontal: w(context, 12),
      vertical: h(context, 20),
    );
  }
}
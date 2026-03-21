import 'package:flutter/material.dart';

/*
*  need a Responsive helper class that do  scale on every device
*   like here i only specify all istable ismobile isfoldable or isportrait and is landscap
*   all for sp , hight, width, and padding. so in code i just have to access this (h,w,sp,padding) only
*   no manualle condition like is tablet is potraitn or is foldable.
* */

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
    const baseWidth = 400.0;
    final side = isTablet(context)
        ? mediaQuery(context).shortestSide
        : mediaQuery(context).width;
    return px * (side / baseWidth);
  }

  // ─── Height scaling ────────────────────────────
  static double h(BuildContext context, double px) {
    const baseHeight = 850.0;
    final side = isTablet(context)
        ? mediaQuery(context).shortestSide
        : mediaQuery(context).height;
    return px * (side / baseHeight);
  }

  // ─── Font / Icon scaling ───────────────────────
  static double sp(BuildContext context, double px) {
    const baseWidth = 400.0;
    final side = isTablet(context)
        ? mediaQuery(context).shortestSide
        : mediaQuery(context).width;
    final scale = side / baseWidth;
    final cappedScale = isTabletLandscape(context) ? scale.clamp(0.0, 1.3) : scale;
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
      horizontal: w(context, 20),
      vertical: h(context, 20),
    );
  }
}
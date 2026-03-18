import 'package:flutter/cupertino.dart';

class ResponsiveHelpers {

  ResponsiveHelpers._();

  static Size mediaQuery(BuildContext context) =>
    MediaQuery.of(context).size;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.shortestSide >= 600;

  static bool isLandScape(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape;

  static bool isTabletLandScape( BuildContext context) =>
      isTablet(context) && isLandScape(context);

  static double scale(BuildContext context, double factor) {
    final width = mediaQuery(context).width;
    return (width * factor).clamp(12.0, 64.0);
  }

}
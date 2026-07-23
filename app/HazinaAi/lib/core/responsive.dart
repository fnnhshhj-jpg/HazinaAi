import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  //==========================================================
  // SCREEN SIZE
  //==========================================================

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  //==========================================================
  // DEVICE TYPE
  //==========================================================

  static bool isMobile(BuildContext context) {
    return screenWidth(context) < 600;
  }

  static bool isTablet(BuildContext context) {
    return screenWidth(context) >= 600 &&
        screenWidth(context) < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return screenWidth(context) >= 1024;
  }

  //==========================================================
  // ORIENTATION
  //==========================================================

  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation ==
        Orientation.portrait;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation ==
        Orientation.landscape;
  }

  //==========================================================
  // WIDTH
  //==========================================================

  static double width(
    BuildContext context,
    double percent,
  ) {
    return screenWidth(context) * percent;
  }

  //==========================================================
  // HEIGHT
  //==========================================================

  static double height(
    BuildContext context,
    double percent,
  ) {
    return screenHeight(context) * percent;
  }

  //==========================================================
  // FONT SIZE
  //==========================================================

  static double font(
    BuildContext context,
    double size,
  ) {
    return screenWidth(context) / 390 * size;
  }

  //==========================================================
  // ICON SIZE
  //==========================================================

  static double icon(
    BuildContext context,
    double size,
  ) {
    return screenWidth(context) / 390 * size;
  }

  //==========================================================
  // PADDING
  //==========================================================

  static EdgeInsets padding(
    BuildContext context,
  ) {
    return EdgeInsets.all(
      width(context, 0.04),
    );
  }

  //==========================================================
  // HORIZONTAL PADDING
  //==========================================================

  static EdgeInsets horizontalPadding(
    BuildContext context,
  ) {
    return EdgeInsets.symmetric(
      horizontal: width(context, 0.04),
    );
  }

  //==========================================================
  // VERTICAL PADDING
  //==========================================================

  static EdgeInsets verticalPadding(
    BuildContext context,
  ) {
    return
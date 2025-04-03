import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/utils/scaling_utility.dart';

class AppStyle {
  static TextStyle style1 = TextStyle(
    color: Colors.white,
    fontSize: getFontSize(
      14,
    ),
    fontFamily: 'DmSans',
    fontWeight: FontWeight.w600,
    fontFeatures: const [FontFeature.proportionalFigures()],
  );

  static TextStyle style2 = TextStyle(
    color: Colors.white,
    fontSize: getFontSize(
      18,
    ),
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w600,
    fontFeatures: const [FontFeature.proportionalFigures()],
  );

  static TextStyle style4 = TextStyle(
    color: Colors.white,
    fontSize: getFontSize(
      17,
    ),
    fontFamily: 'Helvetica',
    fontWeight: FontWeight.w600,
    fontFeatures: const [FontFeature.proportionalFigures()],
  );

  static TextStyle style5 = TextStyle(
    color: Colors.white,
    fontSize: getFontSize(
      16,
    ),
    fontFamily: 'Helvetica',
    fontFeatures: const [FontFeature.proportionalFigures()],
  );

  static TextStyle style6 = TextStyle(
    color: Colors.white,
    fontSize: getFontSize(
      20,
    ),
    fontFamily: 'HelveticaMedium',
    fontFeatures: const [FontFeature.proportionalFigures()],
  );

  static TextStyle style3 = const TextStyle(
    fontSize: 16,
    color: Colors.white,
  );
}

ScalingUtility scale = Get.find<ScalingUtility>()
  ..setCurrentDeviceSize(Get.context!);

double getFontSize(double px) {
  return scale.getScaledFont(px);
}

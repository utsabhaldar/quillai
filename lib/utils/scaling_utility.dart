import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScalingUtils {
  Size figmaPhonePort = Size(360, 640);
  Size desktopViewPort = Size(1366, 768);
  late Size currentDeviceSize;
  late Orientation orientation;
  late double devicePixelRatio;
  late double fw;
  late double fh;

  void setPhoneViewport(Size size) {
    figmaPhonePort = size;
  }

  void setCurrentDeviceSize(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    currentDeviceSize = MediaQuery.of(context).size;
    if (!kIsWeb && orientation == Orientation.landscape) {
      double landscapeWidth = currentDeviceSize.width / 2;
      double landscapeHeight = currentDeviceSize.height / 2;
      currentDeviceSize = Size(landscapeWidth, landscapeHeight);
    }
    fh = currentDeviceSize.height;
    fw = currentDeviceSize.width;

    if (!kIsWeb &&
        (currentDeviceSize.height / currentDeviceSize.width) !=
            (figmaPhonePort.height / figmaPhonePort.width)) {
      currentDeviceSize = Size(
          currentDeviceSize.width,
          (figmaPhonePort.height /
              figmaPhonePort.width *
              currentDeviceSize.width));
    }
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
  }

  EdgeInsetsGeometry getPadding(
      {double? all,
      double? left,
      double? top,
      double? right,
      double? bottom,
      double? horizontal,
      double? vertical}) {
    if (all != null) {
      left = all;
      top = all;
      right = all;
      bottom = all;
    } else if (horizontal != null || vertical != null) {
      left = horizontal ?? 0;
      right = horizontal ?? 0;
      top = vertical ?? 0;
      bottom = vertical ?? 0;
    }
    return EdgeInsets.only(
      left: getScaledWidth(
        left ?? 0,
      ),
      top: getScaledHeight(
        top ?? 0,
      ),
      right: getScaledWidth(
        right ?? 0,
      ),
      bottom: getScaledHeight(
        bottom ?? 0,
      ),
    );
  }

  EdgeInsetsGeometry getMargin(
      {double? all,
      double? left,
      double? top,
      double? right,
      double? bottom,
      double? horizontal,
      double? vertical}) {
    if (all != null) {
      left = all;
      top = all;
      right = all;
      bottom = all;
    } else if (horizontal != null || vertical != null) {
      left = horizontal ?? 0;
      right = horizontal ?? 0;
      top = vertical ?? 0;
      bottom = vertical ?? 0;
    }
    return EdgeInsets.only(
      left: getScaledWidth(
        left ?? 0,
      ),
      top: getScaledHeight(
        top ?? 0,
      ),
      right: getScaledWidth(
        right ?? 0,
      ),
      bottom: getScaledHeight(
        bottom ?? 0,
      ),
    );
  }

  double get fullWidth => currentDeviceSize.width;
  double get fullHeight => currentDeviceSize.height;
  double get heightRatio => !kIsWeb
      ? currentDeviceSize.height / (figmaPhonePort.height)
      : fh / (desktopViewPort.height);
  double get widthRatio => !kIsWeb
      ? currentDeviceSize.width / (figmaPhonePort.width)
      : fw / (desktopViewPort.width);

  double get fontRatio => min(this.widthRatio, this.heightRatio);

  double getScaledHeight(num value) =>
      (this.heightRatio * value).ceilToDouble();

  double getScaledWidth(num value) => (this.widthRatio * value).ceilToDouble();

  double getScaledFont(num value) => (this.fontRatio * value).ceilToDouble();
}

class ScalingUtility {
  static final ScalingUtils _scalingUtility = ScalingUtils()
    ..setCurrentDeviceSize(Get.context!);

  setCurrentDeviceSize(BuildContext context) {
    if (kIsWeb) {
      _scalingUtility.setCurrentDeviceSize(context);
    }
  }

  EdgeInsetsGeometry getPadding(
          {double? all,
          double? left,
          double? top,
          double? right,
          double? bottom,
          double? horizontal,
          double? vertical}) =>
      _scalingUtility.getPadding(
        all: all,
        vertical: vertical,
        horizontal: horizontal,
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      );

  EdgeInsetsGeometry getMargin({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) =>
      _scalingUtility.getMargin(
        all: all,
        vertical: vertical,
        horizontal: horizontal,
        left: left,
        right: right,
        top: top,
        bottom: bottom,
      );

  double get fullWidth => _scalingUtility.fullWidth;
  double get fullHeight => _scalingUtility.fullHeight;
  double get fh => _scalingUtility.fh;
  double get fw => _scalingUtility.fw;
  Size get currentDeviceSize => _scalingUtility.currentDeviceSize;
  double get heightRatio => _scalingUtility.heightRatio;
  double get widthRatio => _scalingUtility.widthRatio;

  double get fontRatio => _scalingUtility.fontRatio;

  double getScaledHeight(num value) => _scalingUtility.getScaledHeight(value);

  double getScaledWidth(num value) => _scalingUtility.getScaledWidth(value);

  double getScaledFont(num value) => _scalingUtility.getScaledFont(value);
}

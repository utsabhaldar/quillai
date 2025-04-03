import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/utils/scaling_utility.dart';

class BackgroundEffect extends StatelessWidget {
  final List<Widget> dynamicChildren;
  const BackgroundEffect({super.key, required this.dynamicChildren});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return SizedBox(
      height: scale.fh,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: -50,
            child: Container(
              width: scale.getScaledHeight(230),
              height: scale.getScaledHeight(230),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(150, 187, 210, 1).withOpacity(0.3),
                borderRadius: BorderRadius.circular(scale.getScaledHeight(50)),
              ),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(scale.getScaledHeight(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: scale.getScaledHeight(500),
            left: scale.getScaledHeight(-200),
            child: Container(
              width: scale.getScaledHeight(230),
              height: scale.getScaledHeight(230),
              decoration: BoxDecoration(
                color: ColorConstant.color6.withOpacity(0.3),
                borderRadius: BorderRadius.circular(scale.getScaledHeight(50)),
              ),
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius:
                            BorderRadius.circular(scale.getScaledHeight(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ...dynamicChildren
        ],
      ),
    );
  }
}

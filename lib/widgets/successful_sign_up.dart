import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/semi_circular_progress_indicator.dart';
import 'package:quillai/widgets/shadow_card.dart';

Widget successfulSignUp({required String? title}) {
  var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(Get.context!);
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    content: CommonShadowWidget(
        dynamicChild: SizedBox(
      height: scale.getScaledHeight(500),
      width: scale.fw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: SemiCircularProgressIndicator(
              progress: 1,
              color: Colors.green,
            ),
          ),
          SizedBox(height: scale.getScaledHeight(20)),
          Center(
              child: Text(title ?? "",
                  style: AppStyle.style2
                      .copyWith(fontSize: scale.getScaledFont(20)),
                  textAlign: TextAlign.center)),
          SizedBox(height: scale.getScaledHeight(50)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.signUpScreen);
                },
                style: TextButton.styleFrom(
                  fixedSize:
                      Size(scale.getScaledWidth(80), scale.getScaledHeight(30)),
                  backgroundColor: ColorConstant.greyButton,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: AppStyle.style3.copyWith(
                    fontSize: scale.getScaledHeight(14),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.signInScreen);
                },
                style: TextButton.styleFrom(
                  fixedSize:
                      Size(scale.getScaledWidth(80), scale.getScaledHeight(30)),
                  backgroundColor: ColorConstant.color3,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                ),
                child: Text(
                  'Ok',
                  style: AppStyle.style3.copyWith(
                    fontSize: scale.getScaledHeight(14),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    )),
  );
}

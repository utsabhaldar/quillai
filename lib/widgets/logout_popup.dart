import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/shadow_card.dart';

Widget logoutPopup({required String? title}) {
  var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(Get.context!);
  return AlertDialog(
    contentPadding: EdgeInsets.zero,
    content: CommonShadowWidget(
        dynamicChild: SizedBox(
      height: scale.getScaledHeight(200),
      width: scale.fw,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(title ?? "",
                  style: AppStyle.style2
                      .copyWith(fontSize: scale.getScaledFont(20)),
                  textAlign: TextAlign.center)),
          SizedBox(height: scale.getScaledHeight(36)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Get.back();
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
                  FirebaseAuth.instance.signOut();
                  Get.toNamed(
                    AppRoutes.signInScreen,
                  );
                  Get.snackbar(
                    "Logout",
                    "Logout Succesful",
                    colorText: Colors.white,
                  );
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
                  'Yes',
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

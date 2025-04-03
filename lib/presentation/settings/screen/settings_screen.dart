import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/profile/screen/profile_screen.dart';
import 'package:quillai/presentation/settings/controller/settings_controller.dart';
import 'package:quillai/presentation/sign_in_screen/controller/sign_in_controller.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/common_network_image.dart';
import 'package:quillai/widgets/drop_down_options.dart';

class SettingsScreen extends GetWidget<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    User? currentUser = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: ColorConstant.color1,
      body: BackgroundEffect(
        dynamicChildren: [
          SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: scale.getScaledHeight(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: scale.getScaledHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: scale.getScaledHeight(10)),
                    ],
                  ),
                  SizedBox(height: scale.getScaledHeight(10)),
                  CommonNetworkImageView(
                    url: ImageConstants.quillai,
                    height: scale.getScaledHeight(40),
                    width: scale.getScaledHeight(82),
                  ),
                  SizedBox(height: scale.getScaledHeight(30)),
                  Expanded(
                    child: ListView(
                      children: [
                        DropDownOptions(
                          icon: Icons.settings_outlined,
                          title: "General Settings".tr,
                          items: [
                            // "Language Preference",
                            'Arabic'.tr,
                            "English",
                          ],
                          scale: scale,
                          onItemTap: (item) {
                            if (item == "Arabic") {
                              controller.setLanguage('ara');
                            } else if (item == "English") {
                              controller.setLanguage('en');
                            }
                          },
                        ),
                        DropDownOptions(
                          icon: Icons.dataset_outlined,
                          title: "Privacy Settings".tr,
                          items: [
                            "Eye".tr,
                            "Fingerprint".tr,
                            "Profile picture".tr,
                            "Update password".tr,
                          ],
                          scale: scale,
                          onItemTap: (item) {
                            if (item == "Eye".tr) {
                              // Get.toNamed(AppRoutes.captureEyeScreen);
                            } else if (item == "Profile picture".tr) {
                              Get.toNamed(AppRoutes.profile);
                            } else if (item == "Update password".tr) {
                              Get.find<SignInController>()
                                  .passwordReset(currentUser!.email);
                            }
                          },
                        ),
                        DropDownOptions(
                          icon: Icons.candlestick_chart_outlined,
                          title: "Security Settings".tr,
                          items: [
                            "Password Management".tr,
                            "Biometric Security".tr,
                            "Device Management".tr,
                          ],
                          scale: scale,
                          onItemTap: (item) {
                            // if (item == "Password Management".tr) {
                            //   Get.toNamed(AppRoutes.passwordManagement);
                            // } else if (item == "Device Management".tr) {
                            //   Get.toNamed(AppRoutes.deviceManagement);
                            // } else if (item == "Biometric Security".tr) {
                            //   Get.toNamed(AppRoutes.biometricManagementScreen);
                            // }
                          },
                        ),
                        SizedBox(height: scale.getScaledHeight(120)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

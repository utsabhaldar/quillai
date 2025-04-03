import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/app_style.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/presentation/sidebar_screen/dashboard_sidebar_screen/controller/dashboard_sidebar_controller.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/drop_down_options.dart';
import 'package:quillai/widgets/logout_popup.dart';

class DashboardSidebarScreen extends GetWidget<DashboardSidebarController> {
  const DashboardSidebarScreen({super.key});

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
                  // CommonNetworkImageView(
                  //   url: ImageConstants.quillai,
                  //   height: scale.getScaledHeight(40),
                  //   width: scale.getScaledHeight(82),
                  // ),
                  Center(
                    child: Container(
                      height: 28,
                      width: 85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: const Color(0xFF3f86bd)),
                      child: const Center(
                        child: Text(
                          'Image 2',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: scale.getScaledHeight(30)),
                  Expanded(
                    child: ListView(
                      children: [
                        DropDownOptions(
                          icon: Icons.book_outlined,
                          title: "Legal".tr,
                          items: [
                            "Privacy Policy".tr,
                            "Terms & Conditions".tr,
                            // "Data Provider Attribution"
                          ],
                          scale: scale,
                          onItemTap: (item) {
                            if (item == "Privacy Policy".tr) {
                              Get.toNamed(AppRoutes.privacyPolicyScreen);
                            } else if (item == "Terms & Conditions".tr) {
                              Get.toNamed(AppRoutes.termsAndConditionsScreen);
                            }
                          },
                        ),
                        DropDownOptions(
                          icon: Icons.person_pin_outlined,
                          title: "Account Information".tr,
                          items: [
                            "Email address".tr,
                            "Name".tr,
                            "Profile picture".tr
                          ],
                          scale: scale,
                          onItemTap: (item) {
                            if (item == "Email address".tr) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: ColorConstant.color1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        scale.getScaledHeight(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        scale.getScaledHeight(26),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height:
                                                  scale.getScaledHeight(10)),
                                          Text(
                                            '${currentUser!.email}',
                                            style: AppStyle.style2,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                              height:
                                                  scale.getScaledHeight(10)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (item == "Name".tr) {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    backgroundColor: ColorConstant.color1,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        scale.getScaledHeight(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        scale.getScaledHeight(26),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height:
                                                  scale.getScaledHeight(10)),
                                          Text(
                                            currentUser!.displayName != null
                                                ? "${currentUser.displayName}"
                                                : "${currentUser.email}",
                                            style: AppStyle.style2,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                              height:
                                                  scale.getScaledHeight(10)),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (item == "Profile picture".tr) {
                              Get.toNamed(AppRoutes.profile);
                            }
                          },
                        ),
                        DropDownOptions(
                          icon: Icons.copyright_outlined,
                          title: "App Version Info".tr,
                          items: const ['Version : 1.0.0'],
                          scale: scale,
                        ),
                        DropDownOptions(
                          icon: Icons.logout_outlined,
                          title: "Logout".tr,
                          items: const [],
                          scale: scale,
                          drop: false,
                          onTap: () {
                            Get.dialog(logoutPopup(title: "Are you sure?".tr));
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

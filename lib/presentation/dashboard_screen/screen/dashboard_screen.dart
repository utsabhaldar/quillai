import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/dashboard_cards.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/app_permission_checker.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/compromised_password.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/customer_feedback.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/device_health_monitoring.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/network_security_alert.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/phishing_detection.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/user_notification.dart';
import 'package:quillai/presentation/profile/controller/profile_controller.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/presentation/dashboard_screen/widgets/inner_widgets/heat_map.dart';
import 'package:quillai/widgets/common_network_image.dart';
import 'package:quillai/widgets/profile_popup.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    // final ProfileController control = Get.find<ProfileController>();
    return Scaffold(
      backgroundColor: ColorConstant.color1,
      body: BackgroundEffect(dynamicChildren: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: scale.getScaledHeight(45),
                bottom: scale.getScaledHeight(25),
                left: scale.getScaledHeight(5),
                right: scale.getScaledHeight(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      // Get.toNamed(AppRoutes.dashboardSidebarScreen);
                    },
                    icon: const Icon(
                      Icons.menu_outlined,
                      color: ColorConstant.color4,
                    ),
                  ),
                  SizedBox(width: scale.getScaledHeight(25)),
                  CommonNetworkImageView(
                    url: ImageConstants.quillai,
                    height: scale.getScaledHeight(40),
                    width: scale.getScaledHeight(82),
                  ),
                  const Spacer(flex: 1),
                  GestureDetector(
                    onTap: () {
                      // Get.toNamed(AppRoutes.notification);
                    },
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_none_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: scale.getScaledHeight(10)),
                  GestureDetector(
                    onTap: () {
                      showPopup(context);
                    },
                    child: Obx(
                      () {
                        final imageBytes =
                            Get.find<ProfileController>().imageBytes.value;

                        return CircleAvatar(
                          backgroundImage: imageBytes != null
                              ? MemoryImage(imageBytes)
                              : AssetImage(ImageConstants.person),
                          radius: scale.getScaledHeight(16),
                        );
                      },
                    ),
                  ),
                  SizedBox(width: scale.getScaledHeight(10)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: scale.getScaledHeight(25),
                        vertical: scale.getScaledHeight(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: scale.getScaledHeight(20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

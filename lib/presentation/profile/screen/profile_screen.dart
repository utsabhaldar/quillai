import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/profile/controller/profile_controller.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    return Scaffold(
      backgroundColor: ColorConstant.color1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                Obx(
                  () => controller.imageBytes.value != null
                      ? CircleAvatar(
                          radius: scale.getScaledHeight(100),
                          backgroundImage:
                              MemoryImage(controller.imageBytes.value!),
                        )
                      : CircleAvatar(
                          radius: scale.getScaledHeight(100),
                          backgroundImage: AssetImage(ImageConstants.person),
                        ),
                ),
                Positioned(
                  bottom: scale.getScaledHeight(0),
                  left: scale.getScaledHeight(140),
                  child: IconButton(
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                    icon: const Icon(Icons.add_a_photo),
                    color: ColorConstant.color4,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: scale.getScaledHeight(100)),
          _customButton(AppRoutes.dashboardScreen, "Save".tr, scale),
        ],
      ),
    );
  }

  Widget _customButton(String route, String buttonTitle, ScalingUtility scale) {
    return Center(
      child: SizedBox(
        width: scale.getScaledHeight(240),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorConstant.color4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(scale.getScaledHeight(6)),
              ),
            ),
          ),
          onPressed: () {
            Get.toNamed(route);
            controller.saveImageBytes();
          },
          child: Text(
            buttonTitle,
            style: const TextStyle(
              color: ColorConstant.color1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    var scale = Get.find<ScalingUtility>();
    showModalBottomSheet(
      backgroundColor: ColorConstant.color1,
      context: context,
      builder: (builder) {
        return Padding(
          padding: EdgeInsets.all(scale.getScaledHeight(18.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height:
                scale.getScaledHeight(MediaQuery.of(context).size.height / 4.5),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.pickImageFromGallery();
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image,
                            size: scale.getScaledHeight(70),
                            color: Colors.white54),
                        Text(
                          "Gallery".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.pickImageFromCamera();
                      Navigator.of(context).pop();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.camera_alt,
                            size: scale.getScaledHeight(70),
                            color: Colors.white54),
                        Text(
                          "Camera".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

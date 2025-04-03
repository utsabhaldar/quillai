import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quillai/constants/color_constants.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:quillai/presentation/profile/controller/profile_controller.dart';
import 'package:quillai/routes/app_routes.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/background_effect.dart';
import 'package:quillai/widgets/profile_popup.dart';

class DashboardScreen extends GetWidget<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);
    List<String> types = ['Journals', 'Articles', 'Summary', 'News', 'Story'];
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
                      Get.toNamed(AppRoutes.dashboardSidebarScreen);
                    },
                    icon: const Icon(
                      Icons.menu_outlined,
                      color: ColorConstant.color4,
                    ),
                  ),
                  SizedBox(width: scale.getScaledHeight(25)),
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
                  const Spacer(flex: 1),
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
                  SizedBox(width: scale.getScaledHeight(20)),
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
                        spacing: 30,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: types.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 35,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(36),
                                      color: const Color(0xFFFFFFFF)),
                                  child: Center(
                                    child: Text(
                                      types[index],
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF0B0B0B)),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 20,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemCount: types.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: const EdgeInsets.all(8),
                                  height: 150,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0xFF000000)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Journal $index',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Color(0xFFFFFFFF)),
                                      ),
                                      Text(
                                        'This is the Journal $index Body',
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                      const Spacer(),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Friday 14 Mar, 2025',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            'Image 4',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 30,
                                );
                              },
                            ),
                          ),
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.transparent,
            child: const CircleAvatar(
              backgroundColor: Color(0XFF3F86BD),
              radius: 25,
              child: Icon(
                Icons.add,
                size: 50,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

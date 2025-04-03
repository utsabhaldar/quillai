import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:quillai/constants/image_constants.dart';
import 'package:quillai/presentation/splash_screen/controller/splash_controller.dart';
import 'package:quillai/utils/scaling_utility.dart';
import 'package:quillai/widgets/common_network_image.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var scale = Get.find<ScalingUtility>()..setCurrentDeviceSize(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
            height: scale.fh,
            width: scale.fw,
            child: CarouselSlider.builder(
              carouselController: controller.carouselController,
              itemCount: controller.images.length,
              options: CarouselOptions(
                height: scale.fh,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                autoPlay: false,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
              ),
              itemBuilder: (context, index, realIndex) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF00458D), Colors.black],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            top: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Obx(
                      () => controller.currentIndex.value ==
                              controller.images.length - 1
                          ? const SizedBox(
                              height: 40,
                            )
                          : TextButton(
                              onPressed: controller.skipToSignIn,
                              child: Text(
                                "Skip".tr,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                    ),
                  ],
                ),
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
                        'Asset 2',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Obx(() => Text(
                          controller.titles[controller.currentIndex.value],
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(height: 30),
                    Center(
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: Text(
                                  controller
                                      .subtitle[controller.currentIndex.value],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.images.length,
                    (index) => Obx(() => Container(
                          width: 57,
                          height: 4,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: controller.currentIndex.value == index
                                ? Colors.white
                                : Colors.grey.shade700,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                  ),
                ),
                Center(
                  child: GestureDetector(
                    onTap: controller.nextSlide,
                    child: Container(
                      height: 53,
                      width: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          color: const Color(0xFF3f86bd)),
                      child: const Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

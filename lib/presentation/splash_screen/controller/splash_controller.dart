import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final currentIndex = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  void nextSlide() {
    if (currentIndex.value < 6) {
      carouselController.nextPage(
        // duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
      currentIndex.value++;
    } else {
      Get.offNamed('/sign_in_screen');
    }
  }

  final List<String> images = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
    'assets/images/image6.png',
    'assets/images/image7.png',
  ];
  final List<String> titles = [
    "Splash_head1".tr,
    "Splash_head2".tr,
    "Splash_head3".tr,
    "Splash_head4".tr,
    "Splash_head5".tr,
    "Splash_head6".tr,
    "Splash_head7".tr,
  ];
  final List<String> subtitle = [
    "Splash_subhead1".tr,
    "Splash_subhead2".tr,
    "Splash_subhead3".tr,
    "Splash_subhead4".tr,
    "Splash_subhead5".tr,
    "Splash_subhead6".tr,
    "Splash_subhead7".tr,
  ];

  void skipToSignIn() {
    Get.offNamed('/sign_in_screen');
  }
}

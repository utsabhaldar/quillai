import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final currentIndex = 0.obs;
  final CarouselSliderController carouselController =
      CarouselSliderController();

  void nextSlide() {
    if (currentIndex.value < 2) {
      carouselController.nextPage(
        curve: Curves.easeInOut,
      );
      currentIndex.value++;
    } else {
      Get.offNamed('/sign_in_screen');
    }
  }

  final List<String> images = [
    'assets/images/image7.png',
    'assets/images/image7.png',
    'assets/images/image7.png',
  ];
  final List<String> titles = [
    "Journal your thoughts".tr,
    "Meet your companion".tr,
    "Reflect and prosper".tr,
  ];
  final List<String> subtitle = [
    "Write down your thoughts, feelings, and\nexperiences in a private, secure space."
        .tr,
    "Quillai understands your feelings and helps\nyou, like a thoughtful companion."
        .tr,
    "Use personalized suggestions to improven\nyour mental well-being over time."
        .tr,
  ];

  void skipToSignIn() {
    Get.offNamed('/sign_in_screen');
  }
}

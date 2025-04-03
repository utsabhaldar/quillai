import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsController extends GetxController {
  final RxString selectedLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguagePreference();
  }

  Future<void> _loadLanguagePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('language');
    if (languageCode != null) {
      selectedLanguage.value = languageCode;
      Get.updateLocale(Locale(languageCode));
    }
  }

  Future<void> setLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
    selectedLanguage.value = languageCode;
    Get.updateLocale(Locale(languageCode));
  }
}

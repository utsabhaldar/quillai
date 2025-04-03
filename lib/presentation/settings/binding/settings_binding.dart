import 'package:get/get.dart';
import 'package:quillai/presentation/settings/controller/settings_controller.dart';
import 'package:quillai/presentation/sign_in_screen/controller/sign_in_controller.dart';

class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}

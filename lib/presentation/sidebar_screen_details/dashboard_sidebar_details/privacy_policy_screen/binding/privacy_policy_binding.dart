import 'package:get/get.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/privacy_policy_screen/controller/privacy_policy_controller.dart';

class PrivacyPolicyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrivacyPolicyController>(() => PrivacyPolicyController());
  }
}

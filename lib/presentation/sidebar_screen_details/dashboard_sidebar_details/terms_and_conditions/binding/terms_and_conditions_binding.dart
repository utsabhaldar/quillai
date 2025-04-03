import 'package:get/get.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/terms_and_conditions/controller/terms_and_conditions_controller.dart';

class TermsAndConditionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TermsAndConditionsController>(
        () => TermsAndConditionsController());
  }
}

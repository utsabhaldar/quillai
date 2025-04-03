import 'package:get/get.dart';
import 'package:quillai/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:quillai/presentation/profile/controller/profile_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}

import 'package:get/get.dart';
import 'package:quillai/presentation/sidebar_screen/dashboard_sidebar_screen/controller/dashboard_sidebar_controller.dart';

class DashboardSidebarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardSidebarController>(() => DashboardSidebarController());
  }
}

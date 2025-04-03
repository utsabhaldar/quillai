import 'package:get/get.dart';
import 'package:quillai/utils/scaling_utility.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ScalingUtility(), permanent: true);
  }
}

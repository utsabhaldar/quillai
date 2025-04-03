import 'package:get/get.dart';
import 'package:quillai/presentation/sign_up_screen/controller/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}

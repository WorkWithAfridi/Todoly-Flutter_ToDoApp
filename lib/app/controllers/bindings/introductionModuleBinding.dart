import 'package:get/get.dart';
import 'package:todoly/app/controllers/authenticationModuleController.dart';
import 'package:todoly/app/controllers/introductionModuleController.dart';

class IntroductionModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IntroductionModuleController(),
    );
    Get.put(AuthenticationModuleController());
  }
}

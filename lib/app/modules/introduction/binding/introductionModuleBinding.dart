import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';
import 'package:todoly/app/modules/introduction/controllers/introductionModuleController.dart';

class IntroductionModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => IntroductionModuleController(),
    );
    Get.put(AuthenticationModuleController());
  }
}

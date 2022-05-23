import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';

class AuthenticationModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthenticationModuleController(),
    );
  }
}

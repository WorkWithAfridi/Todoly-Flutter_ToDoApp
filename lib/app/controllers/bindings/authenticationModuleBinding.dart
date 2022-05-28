import 'package:get/get.dart';
import 'package:todoly/app/controllers/authenticationModuleController.dart';

class AuthenticationModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthenticationModuleController(),
    );
  }
}

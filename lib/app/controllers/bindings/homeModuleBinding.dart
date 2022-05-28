import 'package:get/get.dart';
import 'package:todoly/app/controllers/homeModuleController.dart';

class HomeModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeModuleController(),
    );
  }
}

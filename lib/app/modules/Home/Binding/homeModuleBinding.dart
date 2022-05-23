import 'package:get/get.dart';
import 'package:todoly/app/modules/Home/Controller/homeModuleController.dart';

class HomeModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeModuleController(),
    );
  }
}

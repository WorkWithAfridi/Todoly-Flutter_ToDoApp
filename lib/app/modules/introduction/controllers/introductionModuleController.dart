import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoly/app/routes/routes.dart';

class IntroductionModuleController {
  //Variables
  var currentPageIndex = 0.obs;

  //On SplashScreen init, trigger this function to navigate the screen to the next page
  void triggerSplashScreen() async {
    bool isFirstBoot = await checkIfItsFirstBoot();
    await Future.delayed(const Duration(seconds: 2));
    isFirstBoot
        ? Get.offNamed(ROUTES.getOnBoardingScreenRoute)
        : Get.offNamed(ROUTES.getLoginScreenRoute);
  }

  // Checks if its a new user + first boot.
  Future<bool> checkIfItsFirstBoot() async {
    final box = GetStorage();
    var isFirstBoot = await box.read("isFirstBoot");
    if (isFirstBoot == null) {
      box.write("isFirstBoot", false);
      return true;
    } else {
      return false;
    }
  }

  //on onBoardingScreen next button click trigger this event
  void onNextButtonClick() {
    if (currentPageIndex.value < 2) {
      currentPageIndex.value++;
    } else {
      Get.offNamed(ROUTES.getLoginScreenRoute);
    }
  }
}

import 'package:get/get.dart';
import 'package:todoly/app/routes/routes.dart';

class IntroductionModuleController {
  //Variables
  var currentPageIndex = 0.obs;

  //On SplashScreen init, trigger this function to navigate the screen to the next page
  void triggerSplashScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(ROUTES.getOnBoardingScreenRoute);
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

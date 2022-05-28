import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoly/app/controllers/authenticationModuleController.dart';
import 'package:todoly/app/routes/routes.dart';

import '../services/authenticationFunctions.dart';

class IntroductionModuleController {
  //Variables
  var currentPageIndex = 0.obs;

  //On SplashScreen init, trigger this function to navigate the screen to the next page
  void triggerSplashScreen() async {
    bool isFirstBoot = await checkIfItsFirstBoot();
    await Future.delayed(const Duration(seconds: 2));
    isFirstBoot
        ? Get.offNamed(ROUTES.getOnBoardingScreenRoute)
        : checkIfUserIsLoggedInOrNot();
  }

  //Checks if user is logged in or not
  void checkIfUserIsLoggedInOrNot() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final AuthenticationModuleController authenticationModuleController =
          Get.find();
      authenticationModuleController.userModel =
          await AuthenticationFunctions().getUserData();
      Get.offNamed(ROUTES.getHomeScreenRoute);
    } else {
      Get.offNamed(ROUTES.getLoginScreenRoute);
    }
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

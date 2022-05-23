import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/views/signupScreen.dart';
import 'package:todoly/app/routes/routes.dart';

class AuthenticationModuleController {
  //Variables for LoginScreen
  TextEditingController loginEmailTEC = TextEditingController();
  TextEditingController loginPasswordTEC = TextEditingController();
  var showLoginButtonLoadingAnimation = false.obs;

  //Variables for SignupScreen
  TextEditingController signupEmailTEC = TextEditingController();
  TextEditingController signupPasswordTEC = TextEditingController();
  TextEditingController signupUserNameTEC = TextEditingController();
  TextEditingController signupUserPhoneTEC = TextEditingController();
  var showSignupButtonLoadingAnimation = false.obs;

  //Functions for LoginScreen
  void onSignupOnLoginPageButtonClick() {
    Get.to(
      () => SignupScreen(),
    );
  }

  void onLoginButtonClick() async {
    showLoginButtonLoadingAnimation.value = true;
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(ROUTES.getHomeScreenRoute);
    showLoginButtonLoadingAnimation.value = false;
  }

  //Functions for SignupScreen
  void onSignupButtonClick() async {
    showSignupButtonLoadingAnimation.value = true;
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(ROUTES.getHomeScreenRoute);
    showSignupButtonLoadingAnimation.value = false;
  }
}

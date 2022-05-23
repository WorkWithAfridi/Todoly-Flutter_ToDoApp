import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/views/signupScreen.dart';

class AuthenticationModuleController {
  //Variables for LoginScreen
  TextEditingController loginEmailTEC = TextEditingController();
  TextEditingController loginPasswordTEC = TextEditingController();

  //Variables for SignupScreen
  TextEditingController signupEmailTEC = TextEditingController();
  TextEditingController signupPasswordTEC = TextEditingController();
  TextEditingController signupUserNameTEC = TextEditingController();
  TextEditingController signupUserPhoneTEC = TextEditingController();

  //Functions for LoginScreen
  void onSignupButtonClick() {
    Get.to(
      () => SignupScreen(),
    );
  }
}

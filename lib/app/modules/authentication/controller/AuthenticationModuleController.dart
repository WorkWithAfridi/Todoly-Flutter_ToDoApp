import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/views/signupScreen.dart';
import 'package:todoly/app/routes/routes.dart';
import 'package:todoly/model/userModel.dart';

import '../../../../firebaseFunctions/authenticationFunctions.dart';

class AuthenticationModuleController {
  //User variables
  late UserModel userModel;

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
    await Future.delayed(const Duration(seconds: 2));
    String email = loginEmailTEC.value.text;
    String password = loginPasswordTEC.value.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      String isLoginSuccessful = await AuthenticationFunctions()
          .loginUser(email: email, password: password);
      if (isLoginSuccessful == "Success") {
        Get.offAllNamed(ROUTES.getHomeScreenRoute);
      } else {
        Get.snackbar(
          "Error",
          "Sorry an error occurred while trying to sign you in! Please try again later. :(",
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        );
      }
    } else {
      Get.snackbar(
        "Error logging in!!",
        "User credentials cannot be left empty. :(",
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      );
    }
  }

  //Functions for SignupScreen
  void onSignupButtonClick() async {
    String userName = signupUserNameTEC.value.text;
    String email = signupEmailTEC.value.text;
    String password = signupPasswordTEC.value.text;
    String phone = signupUserPhoneTEC.value.text;
    if (phone.isNotEmpty &&
        userName.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty) {
      showSignupButtonLoadingAnimation.value = true;
      await Future.delayed(const Duration(seconds: 2));
      String isSignupSuccessful = await AuthenticationFunctions().signUpUser(
          userName: userName, email: email, password: password, phone: phone);
      if (isSignupSuccessful == 'Success') {
        Get.offAllNamed(ROUTES.getHomeScreenRoute);
      } else {
        Get.snackbar(
          "Error",
          "Sorry an error occurred while trying to sign you up! Please try again later. :(",
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        );
      }
    } else {
      Get.snackbar(
        "Error signing up!!",
        "User credentials cannot be left empty. :(",
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      );
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/globalWidgets/snackbar.dart';
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
    String email = loginEmailTEC.value.text;
    String password = loginPasswordTEC.value.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      showLoginButtonLoadingAnimation.value = true;
      await Future.delayed(const Duration(seconds: 2));
      String isLoginSuccessful = await AuthenticationFunctions()
          .loginUser(email: email, password: password);
      if (isLoginSuccessful == "Success") {
        showLoginButtonLoadingAnimation.value = false;
        loginEmailTEC.text = '';
        loginPasswordTEC.text = '';
        Get.offAllNamed(ROUTES.getHomeScreenRoute);
      } else {
        showLoginButtonLoadingAnimation.value = false;
        showCustomSnackBar(
          title: "Error",
          message:
              "Sorry an error occurred while trying to sign you in! Please try again later. :(",
        );
      }
    } else {
      showLoginButtonLoadingAnimation.value = false;
      showCustomSnackBar(
        title: "Error logging in!!",
        message: "User credentials cannot be left empty. :(",
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
        showSignupButtonLoadingAnimation.value = false;
        Get.offAllNamed(ROUTES.getHomeScreenRoute);
      } else {
        showSignupButtonLoadingAnimation.value = false;
        showCustomSnackBar(
          title: "Error",
          message:
              "Sorry an error occurred while trying to sign you up! Please try again later. :(",
        );
      }
    } else {
      showSignupButtonLoadingAnimation.value = false;
      showCustomSnackBar(
        title: "Error signing up!!",
        message: "User credentials cannot be left empty. :(",
      );
    }
  }

  //Function to signout/logout user
  void logoutUser() {
    FirebaseAuth.instance.signOut();
    Get.offAllNamed(ROUTES.getLoginScreenRoute);
  }
}

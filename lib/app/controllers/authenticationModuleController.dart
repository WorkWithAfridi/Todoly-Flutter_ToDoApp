import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/constants/constants.dart';
import 'package:todoly/app/widgets/snackbar.dart';
import 'package:todoly/app/routes/routes.dart';
import 'package:todoly/app/views/auth/signupScreen.dart';
import 'package:todoly/app/data/models/userModel.dart';

import '../services/authenticationFunctions.dart';

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

  onLoginButtonClick() async {
    String email = loginEmailTEC.value.text;
    String password = loginPasswordTEC.value.text;
    if (email.isNotEmpty && password.isNotEmpty) {
      showLoginButtonLoadingAnimation.value = true;
      await Future.delayed(waitTime);
      var result = await AuthenticationFunctions()
          .loginUser(email: email, password: password);
      if (result == "Success") {
        userModel = await AuthenticationFunctions().getUserData();
        loginEmailTEC.text = '';
        loginPasswordTEC.text = '';
        Get.offAllNamed(ROUTES.getHomeScreenRoute);
      } else {
        showCustomSnackBar(
          title: "Error",
          message: result.toString(),
        );
      }
      showLoginButtonLoadingAnimation.value = false;
    } else {
      showCustomSnackBar(
        title: "Error!",
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
      String result = await AuthenticationFunctions().signUpUser(
          userName: userName, email: email, password: password, phone: phone);
      if (result == 'Success') {
        userModel = await AuthenticationFunctions().getUserData();
        signupUserNameTEC.text = signupPasswordTEC.text =
            signupEmailTEC.text = signupUserPhoneTEC.text = '';
        Get.offAllNamed(ROUTES.getHomeScreenRoute);
      } else {
        showCustomSnackBar(
          title: "Error",
          message: result,
        );
      }
      showSignupButtonLoadingAnimation.value = false;
    } else {
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

  //Function to delete user
  void deleteUser() async {
    String success = await AuthenticationFunctions().deleteUser();
    if (success == "Success") {
      logoutUser();
      showCustomSnackBar(
        title: "Bye! :)",
        message: "Your user profile has been deleted!",
      );
    }
  }
}

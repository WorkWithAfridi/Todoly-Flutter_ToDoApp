import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';

void showCustomSnackBar({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: whiteColor.withOpacity(.5),
    borderRadius: 8,
    borderColor: primaryColor,
    borderWidth: 1,
    margin: const EdgeInsets.all(10),
    duration: const Duration(seconds: 3),
  );
}

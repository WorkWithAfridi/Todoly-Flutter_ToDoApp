import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';

class Mainframe extends StatelessWidget {
  const Mainframe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Container(
        height: Get.height,
        width: Get.width,
      ),
    );
  }
}

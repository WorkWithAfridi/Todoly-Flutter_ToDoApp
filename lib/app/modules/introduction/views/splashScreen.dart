import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/globalWidgets/appIcon.dart';

import '../controllers/introductionModuleController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final controller = Get.find<IntroductionModuleController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppIcon(
              size: Get.width / 8,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Todoly",
              style: boldTS25.copyWith(
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.triggerSplashScreen();
  }
}

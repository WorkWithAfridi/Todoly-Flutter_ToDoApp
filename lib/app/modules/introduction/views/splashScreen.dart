import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/theme/theme.dart';
import 'package:todoly/app/globalWidgets/appIcon.dart';

import '../controllers/introductionModuleController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  final controller = Get.find<IntroductionModuleController>();

  @override
  Widget build(BuildContext context) {
    controller.triggerSplashScreen();
    return Scaffold(
      backgroundColor: Get.isDarkMode
          ? Get.theme.scaffoldBackgroundColor
          : Get.theme.colorScheme.primary,
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
              style: getBoldTextStyle.copyWith(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/theme/theme.dart';
import 'package:todoly/app/globalWidgets/appIcon.dart';
import 'package:todoly/app/modules/introduction/controllers/introductionModuleController.dart';
import 'package:todoly/app/modules/introduction/widgets/pageIndicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  final IntroductionModuleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppIcon(
              size: Get.width / 3.5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Get things done.",
              style: getBoldTextStyle.copyWith(
                  color: Get.theme.colorScheme.primary, fontSize: 20),
            ),
            getPageText(),
            const SizedBox(
              height: 10,
            ),
            getPageIndicator(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Get.theme.colorScheme.primary,
        onPressed: controller.onNextButtonClick,
        child: const Icon(
          FontAwesomeIcons.arrowRight,
          color: whiteColor,
        ),
      ),
    );
  }

  Widget getPageText() {
    return Obx(
      () {
        return SizedBox(
          height: 100,
          child: Text(
            controller.currentPageIndex.value == 0
                ? "Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis."
                : controller.currentPageIndex.value == 1
                    ? "Donec nec justo eget felis facilisis fermentum. Aliquam porttitor mauris sit amet orci. Aenean dignissim pellentesque felis."
                    : controller.currentPageIndex.value == 2
                        ? "Morbi in sem quis dui placerat ornare. Pellentesque odio nisi, euismod in, pharetra a, ultricies in, diam. Sed arcu. Cras consequat."
                        : "Hello",
            style: getDefaultTextStyle.copyWith(
              color: greyColor,
              fontSize: 14,
            ),
          ),
        );
      },
    );
  }

  Widget getPageIndicator() {
    return Obx(
      () {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomPageIndicator(
              indicatorPosition: 0,
              currentPageIndex: controller.currentPageIndex.value,
            ),
            const SizedBox(
              width: 5,
            ),
            CustomPageIndicator(
              indicatorPosition: 1,
              currentPageIndex: controller.currentPageIndex.value,
            ),
            const SizedBox(
              width: 5,
            ),
            CustomPageIndicator(
              indicatorPosition: 2,
              currentPageIndex: controller.currentPageIndex.value,
            ),
          ],
        );
      },
    );
  }
}

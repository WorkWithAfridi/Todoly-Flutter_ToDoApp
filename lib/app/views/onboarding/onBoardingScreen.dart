import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todoly/app/controllers/introductionModuleController.dart';
import 'package:todoly/app/data/theme/theme.dart';
import 'package:todoly/app/widgets/pageIndicator.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.currentPageIndex.value == 0
                  ? "Stay Organized. Accomplish More."
                  : controller.currentPageIndex.value == 1
                      ? "Simplify Your Life. Conquer Your Tasks."
                      : controller.currentPageIndex.value == 2
                          ? "Effortless Task Management. Seamless Productivity."
                          : "Hello",
              style: getBoldTextStyle.copyWith(color: Get.theme.colorScheme.primary, fontSize: 16),
            ),
            SizedBox(
              height: 100,
              child: Text(
                controller.currentPageIndex.value == 0
                    ? "Introducing Todoly - The ultimate todo app that helps you stay organized and achieve your goals with ease. Manage your tasks, track progress, and boost your productivity."
                    : controller.currentPageIndex.value == 1
                        ? "Welcome to Todoly - The simple and powerful todo app designed to streamline your life. Easily add, prioritize, and complete tasks, ensuring nothing gets overlooked. Take control of your day and conquer your to-do list effortlessly."
                        : controller.currentPageIndex.value == 2
                            ? "Discover Todoly - The app that revolutionizes task management. From adding tasks to tracking progress, Todoly offers a seamless experience for boosting your productivity. Streamline your workflow and achieve more in less time."
                            : "Hello",
                style: getDefaultTextStyle.copyWith(
                  color: greyColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
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

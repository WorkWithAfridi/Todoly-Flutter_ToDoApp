import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/modules/Home/Controller/homeModuleController.dart';
import 'package:todoly/app/modules/Home/views/pagesOnMainframe/dashboard.dart';

class Mainframe extends StatelessWidget {
  Mainframe({Key? key}) : super(key: key);

  final HomeModuleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainframeScaffoldColor,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (value) {
            controller.currentPageIndexOnMainframe.value = value;
          },
          controller: controller.mainframePageController,
          children: [
            Dashboard(),
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: secondaryColor,
          unselectedItemColor: greyColor,
          backgroundColor: whiteColor,
          elevation: 6,
          currentIndex: controller.currentPageIndexOnMainframe.value,
          onTap: (value) {
            if (value == 2) {
              controller.addATaskDialogPopUp();
            } else {
              controller.currentPageIndexOnMainframe.value = value;
              controller.mainframePageController.animateToPage(
                controller.currentPageIndexOnMainframe.value,
                duration: customDuration,
                curve: Curves.linearToEaseOut,
              );
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: controller.currentPageIndexOnMainframe.value == 0
                    ? primaryColor
                    : greyColor,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
                color: controller.currentPageIndexOnMainframe.value == 1
                    ? primaryColor
                    : greyColor,
              ),
              label: "Completed",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                color: controller.currentPageIndexOnMainframe.value == 2
                    ? primaryColor
                    : greyColor,
              ),
              label: "Add a Task",
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/modules/Home/Controller/homeModuleController.dart';
import 'package:todoly/app/modules/Home/views/pagesOnMainframe/dashboard.dart';

import '../../../globalWidgets/textField.dart';

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
      bottomNavigationBar: getBottonNavigationBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddATaskDialogPopUp,
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Obx getBottonNavigationBar() {
    return Obx(() {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: secondaryColor,
        unselectedItemColor: greyColor,
        backgroundColor: whiteColor,
        elevation: 6,
        currentIndex: controller.currentPageIndexOnMainframe.value,
        onTap: (value) {
          controller.currentPageIndexOnMainframe.value = value;
          controller.mainframePageController.animateToPage(
            value,
            duration: customDuration,
            curve: Curves.linearToEaseOut,
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.checklist,
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
        ],
      );
    });
  }

  void showAddATaskDialogPopUp() {
    Get.defaultDialog(
      title: "Adding a Task",
      titleStyle: boldTS25.copyWith(fontSize: 18),
      cancel: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Text(
          'Cancel  ',
          style: boldTS25.copyWith(
            fontSize: 18,
            color: Colors.red,
          ),
        ),
      ),
      onConfirm: () {},
      confirm: Text(
        "  Save",
        style: boldTS25.copyWith(fontSize: 18),
      ),
      content: Container(
        width: Get.width * .85,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: defaultTS.copyWith(
                color: darkBlueColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              TEC: controller.addATaskTitleTEC,
              hint: "Enter a title",
              textInputType: TextInputType.text,
              maxLines: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: defaultTS.copyWith(
                color: darkBlueColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
              TEC: controller.addATaskDescriptionTEC,
              hint: "Enter a description",
              textInputType: TextInputType.text,
              maxLines: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Event date',
              style: defaultTS.copyWith(
                color: darkBlueColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Today",
                    style: defaultTS.copyWith(
                      fontWeight: FontWeight.w800,
                      color: whiteColor,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Schedule",
                    style: defaultTS.copyWith(
                      fontWeight: FontWeight.w800,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      radius: 8,
    );
  }
}

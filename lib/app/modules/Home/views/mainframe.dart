import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/globalWidgets/customCircularProgressLoadingIndicator.dart';
import 'package:todoly/app/modules/Home/Controller/homeModuleController.dart';
import 'package:todoly/app/modules/Home/views/pagesOnMainframe/completed.dart';
import 'package:todoly/app/modules/Home/views/pagesOnMainframe/dashboard.dart';

import '../../../globalWidgets/textField.dart';

class Mainframe extends StatefulWidget {
  Mainframe({Key? key}) : super(key: key);

  @override
  State<Mainframe> createState() => _MainframeState();
}

class _MainframeState extends State<Mainframe> {
  final HomeModuleController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainframeScaffoldColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
        ),
      ),
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
            DashboardPage(),
            CompletedPage(),
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
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "Adding a Task",
          style: boldTS25.copyWith(fontSize: 18),
        ),
        scrollable: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Column(
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
            Obx(() {
              return controller.showSelectedDate.value
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          DateFormat.MMMEd()
                              .format(controller.selectedEventDate.value),
                          style: boldTS25.copyWith(fontSize: 20),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.showSelectedDate.value = false;
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.selectedEventDate.value = DateTime.now();
                            controller.showSelectedDate.value = true;
                          },
                          child: Container(
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
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.selectDate(context);
                          },
                          child: Container(
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
                        ),
                      ],
                    );
            }),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 40,
              width: 80,
              alignment: Alignment.center,
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(8),
              //   border: Border.all(
              //     color: Colors.red,
              //     width: 2
              //   ),
              // ),
              child: Text(
                'Cancel  ',
                style: boldTS25.copyWith(
                  fontSize: 15,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Obx(() {
            return GestureDetector(
              onTap: controller.saveATask,
              child: Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: primaryColor,
                ),
                alignment: Alignment.center,
                child: controller.showLoadingAnimationInAddATaskPopup.value
                    ? const CustomCircularProgressLoadingIndicator()
                    : Text(
                        'Save  ',
                        style: boldTS25.copyWith(
                          fontSize: 15,
                          color: whiteColor,
                        ),
                      ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

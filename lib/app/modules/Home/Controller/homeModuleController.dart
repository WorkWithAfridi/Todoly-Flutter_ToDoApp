import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/globalWidgets/textField.dart';

class HomeModuleController {
  //Variables
  var currentPageIndexOnMainframe = 0.obs;
  PageController mainframePageController = PageController(initialPage: 0);
  TextEditingController addATaskTitleTEC = TextEditingController();
  TextEditingController addATaskDescriptionTEC = TextEditingController();

  //Functions
  void addATaskDialogPopUp() {
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
                TEC: addATaskTitleTEC,
                hint: "Enter title",
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
                TEC: addATaskDescriptionTEC,
                hint: "Enter description",
                textInputType: TextInputType.text,
                maxLines: 5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Time/ Due by',
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
                      "NOW",
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
        radius: 8);
  }
}

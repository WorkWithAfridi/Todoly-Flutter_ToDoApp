import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoly/model/taskModel.dart';

import '../../../data/globalConstants.dart';
import '../../../globalWidgets/customBackButton.dart';

class ShowTaskDetailsScreen extends StatelessWidget {
  final TaskModel taskModel;
  const ShowTaskDetailsScreen({Key? key, required this.taskModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Task details",
          style: boldTS25.copyWith(
            fontSize: 16,
          ),
        ),
        leading: CustomBackButton(),
        backgroundColor: whiteColor,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.red,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.save,
              color: primaryColor,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
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
                Text('This is a title', style: defaultTS),
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
                Text(
                  'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec odio. Quisque volutpat mattis eros. Nullam malesuada erat ut turpis. Suspendisse urna nibh, viverra non, semper suscipit, posuere a, pede.',
                  style: defaultTS,
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
                Text(
                  "${DateFormat.MMMEd().format(DateTime.now())}",
                  style: defaultTS,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Status',
                  style: defaultTS.copyWith(
                    color: darkBlueColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  height: 55,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Active',
                    style: defaultTS.copyWith(
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Pending',
                    style: defaultTS.copyWith(
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 55,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Completed',
                    style: defaultTS.copyWith(
                      fontWeight: FontWeight.w800,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

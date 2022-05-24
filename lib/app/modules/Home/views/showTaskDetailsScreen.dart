import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoly/app/modules/Home/Controller/homeModuleController.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';
import 'package:todoly/firebaseFunctions/postingFunctions.dart';
import 'package:todoly/model/taskModel.dart';

import '../../../data/globalConstants.dart';
import '../../../globalWidgets/customBackButton.dart';
import '../../../globalWidgets/customCircularProgressLoadingIndicator.dart';

class ShowTaskDetailsScreen extends StatelessWidget {
  final TaskModel task;
  ShowTaskDetailsScreen({Key? key, required this.task}) : super(key: key);

  final AuthenticationModuleController authenticationModuleController =
      Get.find();

  final HomeModuleController homeModuleController = Get.find();

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
            onPressed: () {
              homeModuleController.deleteTodoTask(task.id);
            },
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
      backgroundColor: whiteColor,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(authenticationModuleController.userModel.userId)
            .collection('tasks')
            .where(
              'id',
              isEqualTo: task.id,
            )
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CustomCircularProgressLoadingIndicator();
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              TaskModel taskModel =
                  TaskModel.fromSnap(snapshot.data!.docs[index]);
              return Container(
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
                          style: boldTS25.copyWith(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(taskModel.title, style: defaultTS),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Description',
                          style: boldTS25.copyWith(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          taskModel.description,
                          style: defaultTS,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Event date',
                          style: boldTS25.copyWith(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "${DateFormat.MMMEd().format(taskModel.eventDate)}",
                          style: defaultTS,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Status',
                          style: boldTS25.copyWith(
                            color: darkBlueColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            FirebaseFunctions()
                                .changeTaskStatus("Active", taskModel.id);
                          },
                          child: Container(
                            height: 55,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: primaryColor,
                                width: 2,
                              ),
                              color: taskModel.status == "Active"
                                  ? primaryColor
                                  : whiteColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Active',
                              style: defaultTS.copyWith(
                                fontWeight: FontWeight.w800,
                                color: taskModel.status == "Active"
                                    ? whiteColor
                                    : secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            FirebaseFunctions()
                                .changeTaskStatus("Pending", taskModel.id);
                          },
                          child: Container(
                            height: 55,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: primaryColor,
                                width: 2,
                              ),
                              color: taskModel.status == "Pending"
                                  ? primaryColor
                                  : whiteColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Pending',
                              style: defaultTS.copyWith(
                                fontWeight: FontWeight.w800,
                                color: taskModel.status == "Pending"
                                    ? whiteColor
                                    : secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            FirebaseFunctions()
                                .changeTaskStatus("Completed", taskModel.id);
                          },
                          child: Container(
                            height: 55,
                            width: Get.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: primaryColor,
                                width: 2,
                              ),
                              color: taskModel.status == "Completed"
                                  ? primaryColor
                                  : whiteColor,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Completed',
                              style: defaultTS.copyWith(
                                fontWeight: FontWeight.w800,
                                color: taskModel.status == "Completed"
                                    ? whiteColor
                                    : secondaryColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';

import '../../../../../model/taskModel.dart';
import '../../../../data/globalConstants.dart';
import '../../../../globalWidgets/customCircularProgressLoadingIndicator.dart';
import '../../widgets/todoCard.dart';

class CompletedPage extends StatelessWidget {
  CompletedPage({Key? key}) : super(key: key);

  final AuthenticationModuleController authenticationModuleController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Completed Tasks",
                  style: boldTS25.copyWith(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(authenticationModuleController.userModel.userId)
                      .collection('tasks')
                      .where('status', isEqualTo: "Completed")
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CustomCircularProgressLoadingIndicator();
                    }
                    if (snapshot.data!.docs.isEmpty) {
                      return Text(
                        'Nothing here...Zzzz',
                        style:
                            defaultTS.copyWith(color: greyColor, fontSize: 12),
                      );
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        TaskModel taskModel =
                            TaskModel.fromSnap(snapshot.data!.docs[index]);
                        return ToDoCard(
                          task: taskModel,
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

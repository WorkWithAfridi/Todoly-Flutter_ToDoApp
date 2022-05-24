import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoly/app/data/globalConstants.dart';
import 'package:todoly/app/globalWidgets/customCircularProgressLoadingIndicator.dart';
import 'package:todoly/app/modules/Home/views/profile.dart';
import 'package:todoly/app/modules/Home/views/searchScreen.dart';
import 'package:todoly/app/modules/Home/widgets/todoCard.dart';
import 'package:todoly/model/taskModel.dart';

import '../../../authentication/controller/AuthenticationModuleController.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final AuthenticationModuleController authenticationModuleController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: Get.height,
        width: Get.width,
        child: SingleChildScrollView(
          // physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getCustomAppBar(),
              const SizedBox(
                height: 10,
              ),
              getActiveTodoList(),
              getPendingToDoList(),
              getCompletedToDoList(),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding getPendingToDoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Pending To-Dos',
                    style: defaultTS.copyWith(
                      color: darkBlueColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: greyColor,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(authenticationModuleController.userModel.userId)
                .collection('tasks')
                .where('status', isEqualTo: "Pending")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomCircularProgressLoadingIndicator();
              }
              if (snapshot.data!.docs.isEmpty) {
                return Text(
                  'You have no pending tasks, as of right now!',
                  style: defaultTS.copyWith(color: greyColor, fontSize: 12),
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
            height: 10,
          )
        ],
      ),
    );
  }

  Padding getCompletedToDoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Completed',
                    style: defaultTS.copyWith(
                      color: darkBlueColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: greyColor,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(authenticationModuleController.userModel.userId)
                .collection('tasks')
                .where('status', isEqualTo: "Completed")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CustomCircularProgressLoadingIndicator();
              }
              if (snapshot.data!.docs.length == 0) {
                return Text(
                  'Nothing here...Zzzz',
                  style: defaultTS.copyWith(color: greyColor, fontSize: 12),
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
            height: 10,
          )
        ],
      ),
    );
  }

  Padding getActiveTodoList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.pink,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Active',
                    style: defaultTS.copyWith(
                      color: darkBlueColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_drop_down,
                      color: greyColor,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.add,
                      color: greyColor,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(authenticationModuleController.userModel.userId)
                .collection('tasks')
                .where('status', isEqualTo: "Active")
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomCircularProgressLoadingIndicator();
              }
              if (snapshot.data!.docs.isEmpty) {
                return Text(
                  'No active tasks',
                  style: defaultTS.copyWith(color: greyColor, fontSize: 12),
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
            height: 10,
          ),
        ],
      ),
    );
  }

  Container getCustomAppBar() {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            secondaryColor,
            primaryColor,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => ProfileScreen());
                  },
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880'),
                    radius: 30,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        authenticationModuleController.userModel.userName,
                        style: defaultTS.copyWith(
                          color: whiteColor,
                          fontSize: 20,
                          height: 1,
                          fontWeight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        authenticationModuleController.userModel.email,
                        style: defaultTS.copyWith(
                          color: whiteColor,
                          fontSize: 15,
                          height: 1,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SearchScreen());
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: whiteColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.search,
                      color: whiteColor,
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Today, ${DateFormat.MMMEd().format(DateTime.now())}.",
                  style: defaultTS.copyWith(
                    color: whiteColor.withOpacity(.7),
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Todoly Dashboard",
                  style: defaultTS.copyWith(
                      color: whiteColor, fontSize: 25, height: 1),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

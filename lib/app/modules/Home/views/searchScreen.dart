import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/Home/Controller/homeModuleController.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';

import '../../../../model/taskModel.dart';
import '../../../data/globalConstants.dart';
import '../../../globalWidgets/customBackButton.dart';
import '../../../globalWidgets/customCircularProgressLoadingIndicator.dart';
import '../widgets/todoCard.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final HomeModuleController homeModuleController = Get.find();
  final AuthenticationModuleController authenticationModuleController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: boldTS25.copyWith(fontSize: 16, color: whiteColor),
        ),
        leading: CustomBackButton(),
        backgroundColor: secondaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getSearchBar(context),
          Expanded(
            child: Obx(() {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: homeModuleController.showSearchResults.value
                    ? getSearchResults()
                    : const SizedBox.shrink(),
              );
            }),
          )
        ],
      ),
    );
  }

  Column getSearchResults() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          "Search Results",
          style: boldTS25.copyWith(
            fontSize: 20,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(authenticationModuleController.userModel.userId)
                    .collection('tasks')
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
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
                      return taskModel.title.toLowerCase().contains(
                                homeModuleController.searchTEC.value.text
                                    .toLowerCase(),
                              )
                          ? ToDoCard(
                              task: taskModel,
                            )
                          : const SizedBox.shrink();
                    },
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Container getSearchBar(BuildContext context) {
    return Container(
      color: secondaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: defaultTS.copyWith(color: whiteColor),
                  cursorColor: whiteColor,
                  controller: homeModuleController.searchTEC,
                  maxLines: 1,
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    hintText: "Enter a query...",
                    hintStyle: defaultTS.copyWith(
                      color: whiteColor.withOpacity(.7),
                    ),
                    border: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(
                        context,
                        color: whiteColor,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.circular(
                        customBorderRadius,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(
                        context,
                        color: whiteColor,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(
                        customBorderRadius,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: Divider.createBorderSide(
                        context,
                        color: whiteColor,
                        width: .5,
                      ),
                      borderRadius: BorderRadius.circular(
                        customBorderRadius,
                      ),
                    ),
                    fillColor: whiteColor.withOpacity(.1),
                    filled: true,
                    contentPadding: const EdgeInsets.all(
                      10,
                    ),
                  ),
                  onTap: () {
                    homeModuleController.showSearchResults.value = false;
                  },
                  onSubmitted: (value) {
                    homeModuleController.showSearchResults.value = true;
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: homeModuleController.clearScreenInSearchPage,
                child: const SizedBox(
                  height: 50,
                  width: 30,
                  child: Icon(
                    Icons.close,
                    color: whiteColor,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (homeModuleController.searchTEC.value.text.isNotEmpty) {
                    homeModuleController.showSearchResults.value = true;
                  }
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: whiteColor.withOpacity(.1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: whiteColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

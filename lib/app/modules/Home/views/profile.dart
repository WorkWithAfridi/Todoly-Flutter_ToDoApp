import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/authentication/controller/AuthenticationModuleController.dart';

import '../../../data/globalConstants.dart';
import '../../../globalWidgets/customBackButton.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final AuthenticationModuleController authenticationModuleController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: boldTS25.copyWith(fontSize: 16, color: whiteColor),
        ),
        leading: CustomBackButton(),
        backgroundColor: secondaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 180,
              width: Get.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    secondaryColor,
                    primaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880'),
                    radius: 40,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Khondakar Afridi",
                    style: boldTS25.copyWith(color: whiteColor),
                  )
                ],
              ),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            GestureDetector(
              onTap: authenticationModuleController.logoutUser,
              child: Text(
                'Logout',
                style: boldTS25.copyWith(color: primaryColor),
              ),
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

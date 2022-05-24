import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/globalConstants.dart';
import '../../widgets/todoCard.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

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
                // ListView.builder(
                //   itemCount: 10,
                //   shrinkWrap: true,
                //   physics: NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     return ToDoCard();
                //   },
                // ),
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

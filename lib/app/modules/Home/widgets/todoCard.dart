import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:todoly/app/modules/Home/views/showTaskDetailsScreen.dart';

import '../../../data/globalConstants.dart';
import 'package:timeago/timeago.dart' as timeago;

class ToDoCard extends StatelessWidget {
  const ToDoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => ShowTaskDetailsScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: Get.width,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.clipboardCheck,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Some important task that needs attentation!',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  timeago.format(DateTime.now()),
                  style: defaultTS.copyWith(
                    color: greyColor,
                    fontSize: 10,
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

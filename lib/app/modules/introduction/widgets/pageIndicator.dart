import 'package:flutter/material.dart';

import '../../../data/globalConstants.dart';

class CustomPageIndicator extends StatelessWidget {
  final indicatorPosition;
  final currentPageIndex;
  const CustomPageIndicator({Key? key, required this.indicatorPosition, required this.currentPageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 10,
      width: currentPageIndex == indicatorPosition ? 15 : 10,
      decoration: BoxDecoration(
        color: currentPageIndex == indicatorPosition
            ? secondaryColor
            : greyColor,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: customDuration,
    );
  }
}

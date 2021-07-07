import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';

class PageViewIndicator extends StatelessWidget {
  final bool isActive;

  PageViewIndicator(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      height: isActive ? 12 : 12,
      width: isActive ? 12 : 12,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryColor : AppColors.surfaceColor,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
    );
  }
}

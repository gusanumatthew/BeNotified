import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';

class TwoColoredText extends StatelessWidget {
  const TwoColoredText({
    required this.first,
    required this.second,
    this.fontSize,
  });

  final String first;
  final String second;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          first,
          style: AppStyles.titleText.copyWith(
            fontSize: fontSize,
          ),
        ),
        Text(
          second,
          style: AppStyles.titleText.copyWith(
            color: AppColors.primaryColor,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}

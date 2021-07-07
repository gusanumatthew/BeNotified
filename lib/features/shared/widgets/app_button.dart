import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';

class AppButton extends StatelessWidget {
  final Function()? onPressed;
  final String label;

  const AppButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        label,
        style: TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        primary: AppColors.primaryColor,
        onPrimary: AppColors.onPrimaryColor,
      ),
      onPressed: onPressed,
    );
  }
}

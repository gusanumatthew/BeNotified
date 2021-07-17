import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';
import 'spacing.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.onPressed,
    this.noTrailing = false,
  }) : super(key: key);

  final IconData leading;
  final String title;
  final VoidCallback? onPressed;
  final bool noTrailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.blueGrey.shade50,
      onTap: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      leading: Icon(
        leading,
        color: AppColors.primaryColor,
      ),
      title: Text(
        title,
        style: AppStyles.subtitleText,
      ),
      trailing: noTrailing
          ? Spacing.height(0)
          : Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.primaryColor,
            ),
    );
  }
}

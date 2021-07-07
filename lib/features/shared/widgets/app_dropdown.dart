import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    Key? key,
    required this.items,
    this.value,
    required this.hintText,
    this.onChanged,
  }) : super(key: key);

  final List<T> items;
  final T? value;
  final Function(T?)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      onChanged: onChanged,
      value: value,
      items: items
          .map(
            (level) => DropdownMenuItem<T>(
              value: level,
              child: Text(level.toString().split(".")[1]),
            ),
          )
          .toList(),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

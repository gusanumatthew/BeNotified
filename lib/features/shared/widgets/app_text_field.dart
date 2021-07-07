import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';

class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    required this.labelText,
    this.onChanged,
  }) : super(key: key);

  final String labelText;
  final Function(String)? onChanged;

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final focusNode = FocusNode();

  @override
  void initState() {
    focusNode.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? AppColors.primaryColor : null,
        ),
        contentPadding: const EdgeInsets.all(16),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
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

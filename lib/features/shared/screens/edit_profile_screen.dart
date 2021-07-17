import 'package:flutter/material.dart';

import '../../../contents/constants/styles.dart';
import '../models/enums.dart';
import '../widgets/app_button.dart';
import '../widgets/app_dropdown.dart';
import '../widgets/app_text_field.dart';
import '../widgets/spacing.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Wrap(
        children: [
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(32),
            children: <Widget>[
              Text(
                'Edit Profile',
                style: AppStyles.titleText,
              ),
              Divider(height: 32, color: Colors.black54),
              Spacing.smallHeight(),
              AppTextField(
                labelText: 'Full Name',
              ),
              Spacing.bigHeight(),
              AppDropdown<Level>(
                hintText: 'Level',
                items: Level.values,
                value: null,
                // onChanged: (Level? value) => _level = value,
                // validator: validateNotNull,
              ),
              Spacing.bigHeight(),
              AppDropdown<Program>(
                hintText: 'Program',
                items: Program.values,
                value: null,
                // onChanged: (Program? value) => _program = value,
                // validator: validateNotNull,
              ),
              SizedBox(
                height: 24,
              ),
              AppButton(
                label: 'Update Profile',
                onPressed: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}

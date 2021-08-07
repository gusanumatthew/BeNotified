import 'package:flutter/material.dart';

import '../../../contents/constants/styles.dart';
import '../../../contents/utilities/validation_mixin.dart';
import '../models/app_user.dart';
import '../models/enums.dart';
import '../widgets/app_button.dart';
import '../widgets/app_dropdown.dart';
import '../widgets/app_text_field.dart';
import '../widgets/spacing.dart';

class EditProfileScreen extends StatefulWidget {
  final AppUser user;
  final Function(String, Level, Program) editProfile;

  const EditProfileScreen({
    Key? key,
    required this.user,
    required this.editProfile,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with ValidationMixin {
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  late String _name = widget.user.fullName;
  late Level _level = widget.user.level;
  late Program _program = widget.user.program;

  Future<void> editProfile() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await widget.editProfile(_name, _level, _program);

        Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User updated successfully!')),
        );
      } catch (ex) {
        print(ex);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ex.toString())),
        );
      }

      setState(() => isLoading = false);
    }
  }

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
          Form(
            key: _formKey,
            child: ListView(
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
                  initialValue: widget.user.fullName,
                  onChanged: (String? name) => _name = name!,
                ),
                Spacing.bigHeight(),
                AppDropdown<Level>(
                  hintText: 'Level',
                  items: Level.values,
                  value: widget.user.level,
                  onChanged: (Level? value) => _level = value!,
                  validator: (level) =>
                      level == null ? 'Please select a level' : null,
                ),
                Spacing.bigHeight(),
                AppDropdown<Program>(
                  hintText: 'Program',
                  items: Program.values,
                  value: widget.user.program,
                  onChanged: (Program? value) => _program = value!,
                  validator: (program) =>
                      program == null ? 'Please select a program' : null,
                ),
                SizedBox(
                  height: 24,
                ),
                AppButton(
                  isLoading: isLoading,
                  label: 'Update Profile',
                  onPressed: editProfile,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'signin_screen.dart';
import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';
import '../models/enums.dart';
import '../widgets/app_button.dart';
import '../widgets/app_dropdown.dart';
import '../widgets/app_text_field.dart';
import '../widgets/spacing.dart';
import '../widgets/status_bar.dart';
import '../widgets/two_colored_text.dart';

class StudentSignupScreen extends StatelessWidget {
  static const routeName = '/student_signup';

  const StudentSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Statusbar(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.onBackgroundColor),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "logo",
                  child: TwoColoredText(
                    first: 'Be',
                    second: 'Notified',
                    fontSize: 28,
                  ),
                ),
                Spacing.largeHeight(),
                Spacing.largeHeight(),
                Text(
                  'Sign up as Student',
                  style: AppStyles.subtitleText,
                ),
                Spacing.largeHeight(),
                AppTextField(
                  labelText: 'Full Name',
                  onChanged: (_) {},
                ),
                Spacing.bigHeight(),
                AppTextField(
                  labelText: 'Matric Number',
                  onChanged: (_) {},
                ),
                Spacing.bigHeight(),
                AppDropdown<Level>(
                  hintText: 'Level',
                  items: Level.values,
                  value: null,
                  onChanged: (_) {},
                ),
                Spacing.bigHeight(),
                AppDropdown<Program>(
                  hintText: 'Program',
                  items: Program.values,
                  value: null,
                  onChanged: (_) {},
                ),
                Spacing.largeHeight(),
                AppButton(
                  label: 'Sign up',
                  onPressed: () {},
                ),
                Spacing.bigHeight(),
                Text.rich(
                  TextSpan(
                    text: 'Have an account? ',
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(color: AppColors.primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacementNamed(
                              context,
                              SigninScreen.routeName,
                            );
                          },
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

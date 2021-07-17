import 'package:flutter/material.dart';

import 'signin_screen.dart';
import '../widgets/app_button.dart';
import '../widgets/spacing.dart';
import '../widgets/status_bar.dart';
import '../widgets/two_colored_text.dart';
import '../../admin/coordinator_signup_screen.dart';
import '../../student/student_signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Statusbar(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Hero(
                tag: "logo",
                child: TwoColoredText(
                  first: 'Be',
                  second: 'Notified',
                  fontSize: 28,
                ),
              ),
              Spacer(flex: 2),
              AppButton(
                label: 'Sign in',
                onPressed: () => Navigator.pushNamed(
                  context,
                  SigninScreen.routeName,
                ),
              ),
              Spacing.largeHeight(),
              Text('OR', textAlign: TextAlign.center),
              Spacing.largeHeight(),
              AppButton(
                label: 'Sign up as coordinator',
                onPressed: () => Navigator.pushNamed(
                  context,
                  CoordinatorSignupScreen.routeName,
                ),
              ),
              Spacing.bigHeight(),
              AppButton(
                label: 'Sign up as student',
                onPressed: () => Navigator.pushNamed(
                  context,
                  StudentSignupScreen.routeName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

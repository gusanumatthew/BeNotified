import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/spacing.dart';
import '../widgets/status_bar.dart';
import '../widgets/two_colored_text.dart';
import '../../../model/login_model.dart';
import '../../../App/admin_screen.dart';
import '../../../App/user_screen_nav.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = '/signin';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  String id = '';
  String pass = '';

  void loginUser(String id, String pass) {
    for (var user in listOfUsers) {
      if (user.identificationNumber == id && user.password == pass) {
        //login
        if (user.isAdmin == true) {
          // navigate to Admin panel
          Navigator.of(context).pushReplacementNamed(AdminScreen.routeName);
        } else {
          //navigate to User panel
          Navigator.of(context).pushReplacementNamed(UserScreen.routeName);
        }
      } else {
        // throw an error
        print('invalid account/password');
      }
    }
  }

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
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                  'Sign in',
                  style: AppStyles.subtitleText,
                ),
                Spacing.largeHeight(),
                AppTextField(
                  labelText: 'Matric Number/Employee Number',
                  onChanged: (_) {},
                ),
                Spacing.bigHeight(),
                AppTextField(
                  labelText: 'Password',
                  onChanged: (_) {},
                ),
                Spacing.largeHeight(),
                AppButton(
                  label: 'Sign in',
                  onPressed: () {},
                ),
                Spacing.bigHeight(),
                Text.rich(
                  TextSpan(
                    text: 'Don\'t Have an account? ',
                    children: [
                      TextSpan(
                        text: 'Sign up',
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

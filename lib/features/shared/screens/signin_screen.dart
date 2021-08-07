import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';
import '../../../services/authentication_service.dart';
import '../../admin/class_rep_home_screen.dart';
import '../../admin/coordinator_home_screen.dart';
import '../../student/student_home_screen.dart';
import '../models/app_user.dart';
import '../models/enums.dart';
import '../widgets/app_button.dart';
import '../widgets/app_text_field.dart';
import '../widgets/spacing.dart';
import '../widgets/status_bar.dart';
import '../widgets/two_colored_text.dart';
import 'welcome_screen.dart';

class SigninScreen extends StatefulWidget {
  static const routeName = '/signin';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthenticationService();

  String _identificationNumber = '';
  String _password = '';

  bool isLoading = false;

  String? validateNotEmpty(String? value) {
    return value!.isEmpty ? 'Field cannot be empty' : null;
  }

  Future<void> loginUser() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        AppUser user = await _authService.login(
          identificationNumber: _identificationNumber,
          password: _password,
        );

        if (user.role == Role.Student) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            StudentHomeScreen.routeName,
            (route) => false,
            arguments: user,
          );
        } else if (user.role == Role.ClassRep) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            ClassRepHomeScreen.routeName,
            (route) => false,
            arguments: user,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            CoordinatorHomeScreen.routeName,
            (route) => false,
            arguments: user,
          );
        }
      } on FirebaseAuthException catch (ex) {
        final exceptionString =
            ex.message?.replaceAll('email address', 'Identification no');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(exceptionString!)),
        );
      } catch (ex) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(ex.toString())),
        );
      }

      setState(() => isLoading = false);
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
            child: Form(
              key: _formKey,
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
                    onChanged: (String value) => _identificationNumber = value,
                    keyboardType: TextInputType.number,
                    validator: validateNotEmpty,
                  ),
                  Spacing.bigHeight(),
                  AppTextField(
                    labelText: 'Password',
                    onChanged: (String value) => _password = value,
                    obscureText: true,
                    validator: validateNotEmpty,
                  ),
                  Spacing.largeHeight(),
                  AppButton(
                    label: 'Sign in',
                    isLoading: isLoading,
                    onPressed: loginUser,
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
                                WelcomeScreen.routeName,
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
      ),
    );
  }
}

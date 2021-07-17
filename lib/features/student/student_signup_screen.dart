import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../contents/constants/colors.dart';
import '../../contents/constants/styles.dart';
import '../../services/authentication_service.dart';
import '../shared/models/enums.dart';
import '../shared/screens/signin_screen.dart';
import '../shared/widgets/app_button.dart';
import '../shared/widgets/app_dropdown.dart';
import '../shared/widgets/app_text_field.dart';
import '../shared/widgets/spacing.dart';
import '../shared/widgets/status_bar.dart';
import '../shared/widgets/two_colored_text.dart';
import 'student_home_screen.dart';

class StudentSignupScreen extends StatefulWidget {
  static const routeName = '/student_signup';

  @override
  _StudentSignupScreenState createState() => _StudentSignupScreenState();
}

class _StudentSignupScreenState extends State<StudentSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = AuthenticationService();

  String _fullName = '';
  String _matricNumber = '';
  Level? _level;
  Program? _program;
  String _password = '';
  Role _role = Role.Student;

  bool isLoading = false;

  String? validateNotEmpty(String? value) {
    return value!.isEmpty ? 'Field cannot be empty' : null;
  }

  String? validateNotNull<T>(T? value) {
    return value == null ? 'Field cannot be empty' : null;
  }

  Future<void> registerStudent() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() => isLoading = true);

      try {
        await _authService.register(
          fullName: _fullName,
          identificationNumber: _matricNumber,
          level: _level!,
          program: _program!,
          role: _role,
          password: _password,
        );

        Navigator.of(context).pushNamedAndRemoveUntil(
          StudentHomeScreen.routeName,
          (route) => false,
        );
      } on FirebaseAuthException catch (ex) {
        final exceptionString =
            ex.message?.replaceAll('email address', 'matric no');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(exceptionString!)),
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
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
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
                    onChanged: (String value) => _fullName = value,
                    textInputAction: TextInputAction.next,
                    validator: validateNotEmpty,
                  ),
                  Spacing.bigHeight(),
                  AppTextField(
                    labelText: 'Matric Number',
                    onChanged: (String value) => _matricNumber = value,
                    keyboardType: TextInputType.number,
                    validator: validateNotEmpty,
                  ),
                  Spacing.bigHeight(),
                  AppDropdown<Level>(
                    hintText: 'Level',
                    items: Level.values,
                    value: _level,
                    onChanged: (Level? value) => _level = value,
                    validator: validateNotNull,
                  ),
                  Spacing.bigHeight(),
                  AppDropdown<Program>(
                    hintText: 'Program',
                    items: Program.values,
                    value: _program,
                    onChanged: (Program? value) => _program = value,
                    validator: validateNotNull,
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
                    label: 'Sign up',
                    isLoading: isLoading,
                    onPressed: registerStudent,
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
      ),
    );
  }
}

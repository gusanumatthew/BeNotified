import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';
import '../../../services/authentication_service.dart';
import '../../../services/onboarding_service.dart';
import '../../../services/user_service.dart';
import '../../admin/class_rep_home_screen.dart';
import '../../admin/coordinator_home_screen.dart';
import '../../student/student_home_screen.dart';
import '../models/enums.dart';
import 'onboarding_screen.dart';
import 'welcome_screen.dart';

class StartupScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  final _onboardingService = OnboardingService();
  final _authService = AuthenticationService();
  final _userService = UserService();

  @override
  void initState() {
    decideNavigation();
    super.initState();
  }

  void decideNavigation() async {
    await Future.delayed(Duration(seconds: 4));

    if (_onboardingService.getOnboardingViewed() == 1) {
      final user = _authService.getUser;

      if (user == null) {
        Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
      } else {
        final userData = await _userService.getUserWithId(user.uid);
        print(userData.role);
        if (userData.role == Role.Student) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            StudentHomeScreen.routeName,
            (route) => false,
            arguments: userData,
          );
        } else if (userData.role == Role.ClassRep) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            ClassRepHomeScreen.routeName,
            (route) => false,
            arguments: userData,
          );
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
            CoordinatorHomeScreen.routeName,
            (route) => false,
            arguments: userData,
          );
        }
      }
    } else {
      Navigator.of(context).pushReplacementNamed(OnboardingScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Be',
                  style: AppStyles.titleText.copyWith(
                    fontSize: 28,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Notified!',
                      textStyle: AppStyles.titleText.copyWith(
                        color: AppColors.primaryColor,
                        fontSize: 28,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 1,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

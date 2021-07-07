import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';

import 'App/admin_screen.dart';
import 'features/shared/screens/signin_screen.dart';
import 'App/user_screen_nav.dart';
import 'contents/constants/colors.dart';
import 'contents/constants/strings.dart';
import 'features/shared/screens/coordinator_signup_screen.dart';
import 'features/shared/screens/onboarding_screen.dart';
import 'features/shared/screens/welcome_screen.dart';
import 'features/shared/screens/student_signup_screen.dart';
import 'services/onboarding_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  final viewed = OnboardingService().getOnboardingViewed();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        accentColor: AppColors.primaryColor,
      ),
      initialRoute:
          viewed == 1 ? WelcomeScreen.routeName : OnboardingScreen.routeName,
      routes: {
        OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        StudentSignupScreen.routeName: (ctx) => StudentSignupScreen(),
        CoordinatorSignupScreen.routeName: (ctx) => CoordinatorSignupScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
        UserScreen.routeName: (ctx) => UserScreen(),
        AdminScreen.routeName: (ctx) => AdminScreen(),
        // SendInfoScreen.routeName: (ctx) => SendInfoScreen(),
      },
    );
  }
}

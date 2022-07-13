import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'contents/constants/colors.dart';
import 'contents/constants/strings.dart';
import 'features/admin/class_rep_home_screen.dart';
import 'features/admin/coordinator_home_screen.dart';
import 'features/admin/coordinator_signup_screen.dart';
import 'features/admin/send_notice_screen.dart';
import 'features/shared/screens/onboarding_screen.dart';
import 'features/shared/screens/signin_screen.dart';
import 'features/shared/screens/startup_screen.dart';
import 'features/shared/screens/welcome_screen.dart';
import 'features/student/dashboard_screen.dart';
import 'features/student/student_home_screen.dart';
import 'features/student/student_signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) {
      runApp(MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        primaryColorDark: AppColors.primaryColorDark,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: AppColors.primaryColor),
      ),
      initialRoute: StartupScreen.routeName,
      routes: {
        StartupScreen.routeName: (ctx) => StartupScreen(),
        OnboardingScreen.routeName: (ctx) => OnboardingScreen(),
        WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
        StudentSignupScreen.routeName: (ctx) => StudentSignupScreen(),
        CoordinatorSignupScreen.routeName: (ctx) => CoordinatorSignupScreen(),
        SigninScreen.routeName: (ctx) => SigninScreen(),
        StudentHomeScreen.routeName: (ctx) => StudentHomeScreen(),
        DashboardScreen.routeName: (ctx) => DashboardScreen(),
        ClassRepHomeScreen.routeName: (ctx) => ClassRepHomeScreen(),
        CoordinatorHomeScreen.routeName: (ctx) => CoordinatorHomeScreen(),
        SendNoticeScreen.routeName: (ctx) => SendNoticeScreen(),
      },
    );
  }
}

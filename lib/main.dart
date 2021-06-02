import 'package:be_notified/App/admin_message_screen.dart';
import 'package:be_notified/App/admin_screen.dart';
import 'package:be_notified/App/get_started_screen.dart';
import 'package:be_notified/App/login_screen.dart';
import 'package:be_notified/App/user_screen_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BeNotified',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: GetStartedScreen(),
      routes: {
        LoginScreen.routeName: (ctx) => LoginScreen(),
        UserScreen.routeName: (ctx) => UserScreen(),
        AdminScreen.routeName: (ctx) => AdminScreen(),
        SendInfoScreen.routeName: (ctx) => SendInfoScreen(),
      },
    );
  }
}

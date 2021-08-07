import 'package:be_notified/features/shared/models/app_user.dart';
import 'package:flutter/material.dart';

import '../../contents/constants/colors.dart';
import '../shared/screens/notification_screen.dart';
import '../shared/screens/profile_screen.dart';
import 'send_notice_screen.dart';

class ClassRepHomeScreen extends StatefulWidget {
  static const routeName = '/class_rep_home';

  @override
  _ClassRepHomeScreenState createState() => _ClassRepHomeScreenState();
}

class _ClassRepHomeScreenState extends State<ClassRepHomeScreen> {
  int _selectedIndex = 0;

  void _onPageChanged(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as AppUser;

    return Scaffold(
      body: [
        NotificationScreen(user: user),
        ProfileScreen(user: user),
      ].elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Notifications',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            backgroundColor: Colors.black54,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onPageChanged,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(
          context,
          SendNoticeScreen.routeName,
          arguments: user,
        ),
        child: Icon(Icons.message),
      ),
    );
  }
}

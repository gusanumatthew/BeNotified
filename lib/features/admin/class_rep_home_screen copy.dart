import 'package:flutter/material.dart';

import '../../contents/constants/colors.dart';
import '../shared/screens/notification_screen.dart';
import '../shared/screens/profile_screen.dart';

class ClassRepHomeScreen extends StatefulWidget {
  static const routeName = '/class_rep_home';

  @override
  _ClassRepHomeScreenState createState() => _ClassRepHomeScreenState();
}

class _ClassRepHomeScreenState extends State<ClassRepHomeScreen> {
  int _selectedIndex = 0;

  final _pages = <Widget>[
    NotificationScreen(),
    ProfileScreen(),
  ];

  void _onPageChanged(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
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
        onPressed: () {},
        child: Icon(Icons.message),
      ),
    );
  }
}

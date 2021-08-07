import 'package:flutter/material.dart';

import '../../contents/constants/colors.dart';
import '../../model/message.dart';
import '../shared/screens/profile_screen.dart';
import '../shared/widgets/notification_item.dart';

class CoordinatorHomeScreen extends StatefulWidget {
  static const routeName = '/coordinator_home';

  @override
  _CoordinatorHomeScreenState createState() => _CoordinatorHomeScreenState();
}

class _CoordinatorHomeScreenState extends State<CoordinatorHomeScreen> {
  int _selectedIndex = 0;

  final _pages = <Widget>[
    Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8F0009),
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        itemCount: messageList.length,
        itemBuilder: (ctx, i) => NotificationItem(index: i),
      ),
    ),
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

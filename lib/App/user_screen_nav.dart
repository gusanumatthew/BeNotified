import 'package:be_notified/App/user_dept.dart';
import 'package:be_notified/App/user_faculty.dart';
import 'package:be_notified/App/user_home.dart';
import 'package:be_notified/App/user_profile.dart';
import 'package:be_notified/App/user_sch.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static const routeName = '/user';

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    School(),
    Faculty(),
    Department(),
    Profile(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'School',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_library_books_rounded),
            label: 'Faculty',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.today),
            label: 'Department',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profile',
            backgroundColor: Colors.black54,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}

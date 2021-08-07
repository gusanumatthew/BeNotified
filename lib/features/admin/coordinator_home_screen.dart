import 'package:flutter/material.dart';

import '../../contents/constants/colors.dart';
import '../../services/notice_service.dart';
import '../shared/models/app_user.dart';
import '../shared/models/notice.dart';
import '../shared/screens/profile_screen.dart';
import '../shared/widgets/notification_item.dart';
import 'send_notice_screen.dart';

class CoordinatorHomeScreen extends StatefulWidget {
  static const routeName = '/coordinator_home';

  @override
  _CoordinatorHomeScreenState createState() => _CoordinatorHomeScreenState();
}

class _CoordinatorHomeScreenState extends State<CoordinatorHomeScreen> {
  int _selectedIndex = 0;

  void _onPageChanged(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as AppUser;

    return Scaffold(
      body: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF8F0009),
            title: Text('Notifications'),
          ),
          body: StreamBuilder(
            stream: NoticeService().getCoordinatorNotice(user),
            builder: (context, AsyncSnapshot<List<Notice>> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) => NotificationItem(
                    notice: snapshot.data![index],
                  ),
                );
              }
            },
          ),
        ),
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

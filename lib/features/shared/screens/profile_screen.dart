import 'package:flutter/material.dart';

import '../../../contents/constants/colors.dart';
import '../../../contents/constants/styles.dart';
import '../../../services/authentication_service.dart';
import '../widgets/profile_tile.dart';
import '../widgets/spacing.dart';
import 'about_benotified_screen.dart';
import 'edit_profile_screen.dart';
import 'welcome_screen.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authService = AuthenticationService();

  void _editProfileBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) => EditProfileScreen(),
    );
  }

  void _aboutBeNotifiedScreen(context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      isScrollControlled: true,
      builder: (BuildContext context) => AboutBeNotifiedScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: AppColors.primaryColorDark,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Spacing.largeHeight(),
            CircleAvatar(
              child: Text(
                'T',
                style: AppStyles.headlineText,
              ),
              backgroundColor: Colors.blueGrey.shade100,
              radius: 48,
            ),
            Spacing.bigHeight(),
            Text(
              'Gusanu Matthew',
              style: AppStyles.titleText,
            ),
            Spacing.smallHeight(),
            Text('219378213'),
            Spacing.largeHeight(),
            ProfileTile(
              leading: Icons.person_outline,
              onPressed: () => _editProfileBottomSheet(context),
              title: 'Edit Profile',
            ),
            Spacing.bigHeight(),
            ProfileTile(
              leading: Icons.person_outline,
              onPressed: () => _aboutBeNotifiedScreen(context),
              title: 'About BeNotified',
            ),
            Spacing.bigHeight(),
            ProfileTile(
              leading: Icons.logout,
              onPressed: () async {
                await _authService.logout();
                Navigator.of(context)
                    .pushReplacementNamed(WelcomeScreen.routeName);
              },
              title: 'Logout',
            ),
            Spacing.bigHeight(),
          ],
        ),
      ),
    );
  }
}

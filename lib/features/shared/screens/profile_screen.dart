import 'package:be_notified/features/shared/models/app_user.dart';
import 'package:be_notified/features/shared/models/enums.dart';
import 'package:be_notified/services/user_service.dart';
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
  final AppUser user;

  static const routeName = '/profile';

  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authService = AuthenticationService();

  @override
  void initState() {
    updateUser();
    super.initState();
  }

  late AppUser user;

  void updateUser() async {
    user = widget.user;
  }

  Future<void> editProfile(String name, Level level, Program program) async {
    user = await UserService().updateUserWithId(
      widget.user.id,
      fullName: name,
      level: level.index,
      program: program.index,
    );
    setState(() {});
  }

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
      builder: (BuildContext context) => EditProfileScreen(
        user: user,
        editProfile: editProfile,
      ),
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
                user.fullName[0],
                style: AppStyles.headlineText,
              ),
              backgroundColor: Colors.blueGrey.shade100,
              radius: 48,
            ),
            Spacing.bigHeight(),
            Text(
              user.fullName,
              style: AppStyles.titleText,
            ),
            Spacing.smallHeight(),
            Text(user.identificationNumber),
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

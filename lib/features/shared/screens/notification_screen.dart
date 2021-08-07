import 'package:flutter/material.dart';

import '../../../contents/constants/styles.dart';
import '../../../services/notice_service.dart';
import '../models/app_user.dart';
import '../models/notice.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
  final AppUser user;

  const NotificationScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: AppStyles.bodyText,
            tabs: [
              Tab(text: 'Coordinator'),
              Tab(text: 'Class Rep'),
            ],
          ),
          backgroundColor: Color(0xFF8F0009),
          title: Text('Notifications'),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
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
            StreamBuilder(
              stream: NoticeService().getClassRepNotice(user),
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
          ],
        ),
      ),
    );
  }
}

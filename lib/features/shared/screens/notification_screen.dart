import 'package:flutter/material.dart';

import '../../../contents/constants/styles.dart';
import '../../../model/message.dart';
import '../widgets/notification_item.dart';

class NotificationScreen extends StatelessWidget {
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
            ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              itemCount: messageList.length,
              itemBuilder: (ctx, i) => NotificationItem(index: i),
            ),
            ListView.builder(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              itemCount: messageList.length,
              itemBuilder: (ctx, i) => NotificationItem(index: i),
            ),
          ],
        ),
      ),
    );
  }
}

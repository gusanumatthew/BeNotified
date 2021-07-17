import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../contents/constants/styles.dart';
import '../../../model/message.dart';
import 'spacing.dart';

class NotificationItem extends StatelessWidget {
  final int index;

  NotificationItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.white,
        elevation: 5.0,
        borderRadius: BorderRadius.circular(24.0),
        shadowColor: Colors.blueGrey.shade50,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    messageList[index].title,
                    style: AppStyles.titleText,
                  ),
                  Spacing.mediumHeight(),
                  Text(messageList[index].desc),
                  Spacing.mediumHeight(),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 8),
                          Text(messageList[index].time),
                        ],
                      ),
                      SizedBox(width: 16),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range_outlined,
                            color: Colors.black54,
                          ),
                          SizedBox(width: 8),
                          Text(messageList[index].date),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

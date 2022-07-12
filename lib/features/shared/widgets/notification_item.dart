import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../contents/constants/styles.dart';
import '../models/notice.dart';
import 'spacing.dart';

class NotificationItem extends StatelessWidget {
  final Notice notice;

  NotificationItem({required this.notice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
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
                    notice.title,
                    style: AppStyles.titleText,
                  ),
                  Spacing.mediumHeight(),
                  Text(notice.description),
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
                          Text(notice.deadlineTime.format(context)),
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
                          Text(DateFormat()
                              .add_yMEd()
                              .format(notice.deadlineDate)),
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

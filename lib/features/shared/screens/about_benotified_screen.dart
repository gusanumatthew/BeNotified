import 'package:flutter/material.dart';

import '../../../contents/constants/styles.dart';
import '../widgets/spacing.dart';
import '../widgets/two_colored_text.dart';

class AboutBeNotifiedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TwoColoredText(first: 'Be', second: 'Notified'),
                Divider(height: 32, color: Colors.black54),
                Spacing.smallHeight(),
                Text(
                  "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                  style: AppStyles.bodyText,
                ),
                Spacing.mediumHeight(),
                Text(
                  'Developer Contact',
                  style: AppStyles.titleText,
                ),
                Divider(color: Colors.black54),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.email, color: Colors.black54),
                  title: Text('Email : contact@benotified.com'),
                ),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading:
                      Icon(Icons.location_on_outlined, color: Colors.black54),
                  title: Text('Address : Benotified inc. Ibadan,Oyo State'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

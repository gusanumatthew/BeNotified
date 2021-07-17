import 'package:flutter/material.dart';

import '../../contents/constants/styles.dart';
import '../shared/widgets/spacing.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Color(0xFF8F0009),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacing.bigHeight(),
              Text('ABOUT THE SCHOOL', style: AppStyles.titleText),
              Spacing.smallHeight(),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                textAlign: TextAlign.start,
              ),
              Spacing.bigHeight(),
              Text(
                'FACULTY OF SCIENCE',
                style: AppStyles.titleText,
              ),
              Spacing.smallHeight(),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                textAlign: TextAlign.start,
              ),
              Spacing.bigHeight(),
              Text(
                'DEPARTMENT OF COMPUTER-SCIENCE',
                style: AppStyles.titleText,
              ),
              Spacing.smallHeight(),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

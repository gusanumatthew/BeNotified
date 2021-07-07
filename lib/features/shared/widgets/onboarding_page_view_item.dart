import 'package:flutter/material.dart';

import '../models/onboarding_item.dart';
import 'spacing.dart';
import 'two_colored_text.dart';

class OnboardingPageViewItem extends StatelessWidget {
  final OnboardingItem onboardingItem;

  OnboardingPageViewItem({required this.onboardingItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          onboardingItem.imageUrl,
          width: 250,
          height: 250,
        ),
        Spacing.largeHeight(),
        TwoColoredText(
          first: onboardingItem.title,
          second: onboardingItem.tit,
        ),
        Spacing.mediumHeight(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            onboardingItem.desc,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

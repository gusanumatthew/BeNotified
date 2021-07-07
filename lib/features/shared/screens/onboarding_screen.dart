import 'dart:async';

import 'package:flutter/material.dart';

import '../../../contents/constants/images.dart';
import '../../../services/onboarding_service.dart';
import '../models/onboarding_item.dart';
import '../widgets/app_button.dart';
import '../widgets/onboarding_page_view_item.dart';
import '../widgets/page_view_indicator.dart';
import '../widgets/spacing.dart';
import '../widgets/status_bar.dart';
import 'welcome_screen.dart';

class OnboardingScreen extends StatefulWidget {
  static const routeName = '/onboarding';

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);

    Timer.periodic(
      Duration(seconds: 5),
      (Timer timer) {
        _currentPage < 3 ? _currentPage++ : _currentPage = 0;

        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) => setState(() => _currentPage = index);

  final _onboardingItems = [
    OnboardingItem(
      imageUrl: AppImage.onboardingIllustration1,
      title: 'Welcome To Be',
      tit: 'Notified',
      desc:
          'Take a step to get connected and never loose informations with BeNotified.',
    ),
    OnboardingItem(
      imageUrl: AppImage.onboardingIllustration2,
      title: 'Easy Access',
      tit: '',
      desc:
          'A digital notice board, An innovative way to get informations from Authorities',
    ),
    OnboardingItem(
      imageUrl: AppImage.onboardingIllustration3,
      title: 'Notification Made Easier',
      tit: '',
      desc: 'Information at your fingertips,get connected anytime, anyday ',
    ),
    OnboardingItem(
      imageUrl: AppImage.onboardingIllustration4,
      title: 'Stay Connected',
      tit: '',
      desc: 'Moveable digital notice board get notified anywhere',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Statusbar(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChanged,
                  itemCount: _onboardingItems.length,
                  itemBuilder: (ctx, index) => OnboardingPageViewItem(
                    onboardingItem: _onboardingItems[index],
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  for (int i = 0; i < _onboardingItems.length; i++)
                    i == _currentPage
                        ? PageViewIndicator(true)
                        : PageViewIndicator(false)
                ],
              ),
              Spacing.largeHeight(),
              SizedBox(
                width: 200,
                child: AppButton(
                  label: 'Get Started',
                  onPressed: () async {
                    await OnboardingService().setOnboardingViewed();
                    Navigator.pushReplacementNamed(
                      context,
                      WelcomeScreen.routeName,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

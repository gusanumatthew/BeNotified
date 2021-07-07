import 'package:get_storage/get_storage.dart';

const ONBOARDINGVIEWED = "viewedOnboarding";

class OnboardingService {
  static final OnboardingService _instance = OnboardingService._internal();

  OnboardingService._internal();

  factory OnboardingService() => _instance;

  final box = GetStorage();

  Future<void> setOnboardingViewed() async {
    await box.write(ONBOARDINGVIEWED, 1);
  }

  int getOnboardingViewed() {
    return box.read(ONBOARDINGVIEWED) ?? 0;
  }
}

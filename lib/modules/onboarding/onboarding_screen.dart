import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/models/onboarding_data.dart';
import 'package:movies/modules/onboarding/widgets/onboarding_firstpage.dart';
import 'package:movies/modules/onboarding/widgets/onboarding_page.dart';

import '../../core/services/local_storage_keys.dart';
import '../../core/services/local_storage_services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) => setState(() => currentIndex = index),
        itemBuilder: (context, index) {
          final data = onboardingData[index];

          if (index == 0) {
            return OnboardingFirstpage(
              onboardingData: data,
              onNext: () => pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            );
          } else {
            return OnboardingPage(
              index: currentIndex,
              onboardingData: data,
              nextText: index == onboardingData.length - 1 ? "Finish" : "Next",
              onNext: () {
                if (index == onboardingData.length - 1) {
                  _seenOnBoarding();
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              onBack: () => pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              ),
            );
          }
        },
      ),
    );
  }

  void _seenOnBoarding() async {
    LocalStorageServices.setBool(LocalStorageKeys.firstTime, false);
    Navigator.of(context).pushReplacementNamed(PageRouteName.singIn);
  }
}

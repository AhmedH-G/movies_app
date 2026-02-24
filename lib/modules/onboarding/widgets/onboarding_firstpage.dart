import 'package:flutter/material.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/models/onboarding_data.dart';


class OnboardingFirstpage extends StatelessWidget {
  final OnboardingData onboardingData;
  final VoidCallback onNext;
  const OnboardingFirstpage({
    super.key,
    required this.onboardingData,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(onboardingData.image),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: onboardingData.gradientColors,
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.0, 0.3, 0.6, 0.8],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                onboardingData.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineLarge,
              ),
              SizedBox(height: 18),
              if (onboardingData.description != null)
                Text(
                  onboardingData.description!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: Colors.white.withValues(alpha: 0.6),
                    fontSize: 18,
                    height: 1.4,
                  ),
                ),
              SizedBox(height: 20),
              CustomElevatedButton(bottonText: 'Explore', onPressed: onNext),
            ],
          ),
        ),
      ],
    );
  }
}

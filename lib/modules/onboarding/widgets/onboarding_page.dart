import 'package:flutter/material.dart';
import 'package:movies/core/theme/color_pallete.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_outlined_button_widget.dart';
import 'package:movies/models/onboarding_data.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingData onboardingData;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final String nextText;
  final int index;
  const OnboardingPage({
    super.key,
    required this.onboardingData,
    required this.onNext,
    required this.onBack,
    required this.nextText,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: screenHeight * 0.75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(onboardingData.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: onboardingData.gradientColors,
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [0.0, 0.9],
                ),
              ),
            ),
          ),
        ),

        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: ColorPallete.colorBlack,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  onboardingData.title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
                SizedBox(height: 16),
                if (onboardingData.description != null &&
                    onboardingData.description!.isNotEmpty)
                  Text(
                    onboardingData.description!,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                SizedBox(height: 28),
                CustomElevatedButton(bottonText: nextText, onPressed: onNext),
                if (index > 1) ...[
                  const SizedBox(height: 10),
                  CustomOutlinedButtonWidget(text: "Back", onPressed: onBack),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}

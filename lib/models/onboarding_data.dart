import 'package:flutter/material.dart';
import '../core/gen/assets.gen.dart';
import '../core/theme/color_pallete.dart';

class OnboardingData {
  final String image;
  final String title;
  final String? description;
  final List<Color> gradientColors;

  OnboardingData({
    required this.image,
    required this.title,
    this.description,
    required this.gradientColors,
  });
}

List<OnboardingData> onboardingData = [
  OnboardingData(
    image: Assets.images.onBoarding1.path,
    title: "Find Your Next\nFavorite Movie Here",
    description:
        "Get access to a huge library of movies\nto suit all tastes. You will surely like it.",
    gradientColors: [
      ColorPallete.colorBlack,
      ColorPallete.colorBlack.withValues(alpha: 0.9),
      ColorPallete.colorBlack.withValues(alpha: 0.5),
      ColorPallete.colorBlack.withValues(alpha: 0.0),
    ],
  ),
  OnboardingData(
    image: Assets.images.onBoarding2.path,
    title: "Discover Movies",
    description:
        "Explore a vast collection of movies in all\nqualities and genres. Find your next\nfavorite film with ease.",
    gradientColors: [
      ColorPallete.colorGradientDarkBlue,
      ColorPallete.colorGradientDarkBlue.withValues(alpha: 0.0),
    ],
  ),
  OnboardingData(
    image: Assets.images.onBoarding3.path,
    title: "Explore All Genres",
    description:
        "Discover movies from every genre, in all\navailable qualities. Find something new\nand exciting to watch every day.",
    gradientColors: [
      ColorPallete.colorGradientDarkRed,
      ColorPallete.colorGradientDarkRed.withValues(alpha: 0.0),
    ],
  ),
  OnboardingData(
    image: Assets.images.onBoarding4.path,
    title: "Create Watchlists",
    description:
        "Save movies to your watchlist to keep\ntrack of what you want to watch next.\nEnjoy films in various qualities and\ngenres.",
    gradientColors: [
      ColorPallete.colorGradientDarkPurple,
      ColorPallete.colorGradientDarkPurple.withValues(alpha: 0.0),
    ],
  ),
  OnboardingData(
    image: Assets.images.onBoarding5.path,
    title: "Rate, Review, and Learn",
    description:
        "Share your thoughts on the movies\nyou've watched. Dive deep into film\ndetails and help others discover great\nmovies with your reviews.",
    gradientColors: [
      ColorPallete.colorGradientDeepRed,
      ColorPallete.colorGradientDeepRed.withValues(alpha: 0.0),
    ],
  ),
  OnboardingData(
    image: Assets.images.onBoarding6.path,
    title: "Start Watching Now",
    gradientColors: [
      ColorPallete.colorGradientDarkGrey,
      ColorPallete.colorGradientDarkGrey.withValues(alpha: 0.0),
    ],
  ),
];

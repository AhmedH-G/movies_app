import 'package:flutter/material.dart';
import 'package:movies/core/routes/page_route_name.dart';
import 'package:movies/modules/onboarding/onboarding_screen.dart';
import '../../modules/authentication/forget_password/forget_password_view.dart';
import '../../modules/authentication/sign_in/sign_in_view.dart';
import '../../modules/authentication/sign_up/sign_up_view.dart';
import '../../modules/profile/pick_avatar_screen.dart';
import '../../modules/profile/update_screen.dart';

abstract class AppRouters {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {

      case PageRouteName.onboardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: settings,
        );

      case PageRouteName.singIn:
        return MaterialPageRoute(
          builder: (context) => const SignInView(),
          settings: settings,
        );

      case PageRouteName.singUp:
        return MaterialPageRoute(
          builder: (context) => const SignUpView(),
          settings: settings,
        );

      case PageRouteName.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordView(),
          settings: settings,
        );

     case PageRouteName.pickAvatar:
       return MaterialPageRoute(
      builder: (context) => const PickAvatarScreen(),
          settings: settings,
    );

       case PageRouteName.updateScreen:
         return MaterialPageRoute(
          builder: (context) => const UpdateScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
          settings: settings,
        );

    }
  }
}

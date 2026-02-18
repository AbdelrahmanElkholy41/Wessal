
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wesal/core/routing/routes.dart';
import 'package:wesal/feature/auth/ui/login_screen.dart';
import '../../feature/auth/ui/complete_signup2.dart';
import '../../feature/auth/ui/complete_sigup.dart';
import '../../feature/auth/ui/signup_screen.dart';
import '../../feature/home/ui/home_screen.dart';
import '../../feature/onBoarding/ui/onboarding1.dart';
import '../../feature/onBoarding/ui/onboarding2.dart';
import '../../feature/onBoarding/ui/onboarding3.dart';
import '../../feature/onBoarding/ui/onboarding4.dart';
import '../../feature/onBoarding/ui/splash_screennnnn.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingScreen1:
        return MaterialPageRoute(builder: (_) => const Onboarding1());
      case Routes.onBoardingScreen2:
        return MaterialPageRoute(builder: (_) => const Onboarding2());
      case Routes.onBoardingScreen4:
        return MaterialPageRoute(builder: (_) => const Onboarding4());
      case Routes.onBoardingScreen3:
        return MaterialPageRoute(builder: (_) => const Onboarding3 ());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.completeSigUp:
        return MaterialPageRoute(builder: (_) => const CompleteSigup());
      case Routes.completeSigUp2:
        return MaterialPageRoute(builder: (_) => const CompleteSignup2());



      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

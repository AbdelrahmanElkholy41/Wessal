
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wesal/core/routing/routes.dart';

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

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

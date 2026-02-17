import 'package:flutter/material.dart';
import 'package:wesal/core/helpers/extensions.dart';
import 'package:wesal/feature/onBoarding/ui/widget/custom_app_bar.dart';
import 'package:wesal/feature/onBoarding/ui/widget/onboarding_widget.dart';

import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_main_button.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: AppTextButton(
          backgroundColor: Color(0xff676BFF),
          buttonText: 'Get Started',
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffF9FCFF),
          ),
          onPressed: () {
            context.pushNamed(Routes.onBoardingScreen4);
          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomAppBar(index: 2, skipAppear: true,),
      ),
      body: OnboardingWidget(
        image: 'assets/images/amico.png',
        title: 'Learn & Improve Your Signing Skills',
        description:
            'Explore guided lessons, practice signs, and track your progress — all in one place.',
        currentIndex: 2,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wesal/core/helpers/extensions.dart';
import 'package:wesal/core/widgets/custom_main_button.dart';
import 'package:wesal/feature/onBoarding/ui/widget/custom_app_bar.dart';
import 'package:wesal/feature/onBoarding/ui/widget/onboarding_widget.dart';

import '../../../core/routing/routes.dart';

class Onboarding4 extends StatelessWidget {
  const Onboarding4({super.key});

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
            context.pushNamed(Routes.signUpScreen);
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
        image: 'assets/images/pana.png',
        title: 'Your Smart ASL Dictionary',
        description:
            'Search signs, watch guided videos, and learn meanings with ease.',
        currentIndex: 3

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/extensions.dart';
import 'package:wesal/core/helpers/spacing.dart';
import 'package:wesal/core/widgets/custom_main_button.dart';
import 'package:wesal/feature/onBoarding/ui/widget/custom_app_bar.dart';
import 'package:wesal/feature/onBoarding/ui/widget/onboarding_widget.dart';

import '../../../core/routing/routes.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

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
            Navigator.pushNamed(context, Routes.onBoardingScreen2);
          },
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomAppBar(index: 0, skipAppear: true,),
      ),
      body: OnboardingWidget(
        currentIndex: 0,
        image: "assets/images/voice.png",
        title: 'Wesal to be your voice',
        description:
            'Welcome to a world of effective\n communication possibility. Communicate with the world effectively with text, Speech or sign.'
            ' the choice is yours.',
      ),
    );
  }
}

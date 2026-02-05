import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/spacing.dart';
import 'package:wesal/core/widgets/custom_main_button.dart';

import 'custom_app_bar.dart';
import 'onboarding_widget.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomAppBar(),
      ),
      body: OnboardingWidget(
        image: "assets/images/voice.png",
        title: 'Wesal to be your voice',
        description: 'Welcome to a world of effective\n communication possibility. Communicate with the world effectively with text, Speech or sign.'
         ' the choice is yours.',
      ),
    );
  }
}

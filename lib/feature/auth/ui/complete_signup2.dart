import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/extensions.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_main_button.dart';
import '../../onBoarding/ui/widget/custom_app_bar.dart';

class CompleteSignup2 extends StatelessWidget {
  const CompleteSignup2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: AppTextButton(
          backgroundColor: Color(0xff676BFF),
          buttonText: 'Save and Next',
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffF9FCFF),
          ),
          onPressed: () {

          },
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomAppBar(index: 2, skipAppear: true),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            children: [
              verticalSpace(16.h),
              Text(
                'Set up your Touch ID',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff676BFF),
                ),
              ),
              verticalSpace(16.h),
              Center(child: Image.asset('assets/images/woman.png')),
              verticalSpace(40.h),
              Text(
                'Set up your Touch ID',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff094173),
                ),
              ),
              verticalSpace(12.h),
              Text(
                'Rest and Lift your finger repeatedly',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff094173),
                ),
              ),
              verticalSpace(40.h),
              Image.asset('assets/images/pasmaa.png'),
              verticalSpace(40.h),
              Text('Reset',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff094173)),)
              

            ],
          ),
        ),
      ),
    );
  }
}

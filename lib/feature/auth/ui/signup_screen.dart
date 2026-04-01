import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/extensions.dart';
import 'package:wesal/core/widgets/coutom_text_field.dart';
import 'package:wesal/core/widgets/custom_main_button.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/login_with.dart';
import '../../../core/routing/routes.dart';
import '../../onBoarding/ui/widget/custom_app_bar.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: CustomAppBar(index: 2, skipAppear: false),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              verticalSpace(16.h),
              Center(child: Image.asset('assets/images/woman.png')),
              verticalSpace(24.h),
              Text(
                'Sign Up',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.sp,
                  color: Color(0xff676BFF),
                ),
              ),
              verticalSpace(100.h),
              LoginWith(
                text: 'Connect With Google',
                image: 'assets/images/google.png',
              ),
              verticalSpace(200.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Already have an Account?',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                      color: Color(0xff094173),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.loginScreen);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff676BFF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

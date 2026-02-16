import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/extensions.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_main_button.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.currentIndex,

  });
  final String image;
  final String title;
  final String description;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        children: [
          verticalSpace(43.h),
          Center(child: Image.asset(image)),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Color(0xff094173),
            ),
          ),
          verticalSpace(4.h),
          Text(
            description,
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Color(0xff094173),
            ),
          ),
          verticalSpace(91.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return Row(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: index == currentIndex
                        ? Color(0xff094173)
                        : Color(0xffD9D9D9),
                  ),
                  if (index != 3) SizedBox(width: 8.w),
                ],
              );
            }),
          ),
          verticalSpace(30.h),

        ],
      ),
    );
  }
}

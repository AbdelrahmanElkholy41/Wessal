import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/coutom_text_field.dart';

class AppBarLearn extends StatelessWidget {
  const AppBarLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xff6C63FF),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(40.h),

          Row(
            children: [
              Image.asset('assets/images/arrow1.png'),
              horizontalSpace(16.w),
              Text(
                "Welcome Back!",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border_purple500_outlined,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55.0),
            child: Text(
              "Ready to learn today?",
              style: TextStyle(color: Colors.white70),
            ),
          ),
          verticalSpace(16.h),

          CustomTextField(
            prefixIcon: Icon(Icons.search, color: Colors.white70, size: 25),
            hintText: 'search',
            validator: (value) {},
            backgroundColor: Colors.white24,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.sp),
              borderSide: BorderSide(color: Colors.white24),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14.sp),
              borderSide: BorderSide(color: Colors.white24),
            ),
          ),
        ],
      ),
    );
  }
}

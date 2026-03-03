import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/extensions.dart';
import 'package:wesal/feature/home/ui/widget/app_bar.dart';
import 'package:wesal/feature/home/ui/widget/quick_sings.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarr(),
            verticalSpace(16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    'Recents',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Color(0xff454663),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  //horizontalSpace(8.w),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_down_sharp, size: 30),
                  ),
                ],
              ),
            ),
            verticalSpace(10.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quick Signs',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff01012E),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(Routes.AllMySigns);
                    },
                    child: Text(
                      'View All',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: Color(0xff454663),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(11.h),
            SizedBox(
              height: 180.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: QuickSigns(),
                    );
                  },
                ),
              ),
            ),
            verticalSpace(16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.sp),
                  border: Border.all(
                    color: Color(0xff676BFF80),
                    width: 1.sp,
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/signi.png'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Make Your Sign',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff01012E),
                              ),
                            ),
                            Text('Record your hand movement and \n save it as a GIF',style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff7B7B7D),
                            ),)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





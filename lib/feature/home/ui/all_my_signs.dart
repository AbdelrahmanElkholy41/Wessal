import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/extensions.dart';
import 'package:wesal/feature/home/ui/widget/app_bar.dart';
import 'package:wesal/feature/home/ui/widget/quick_sings.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/custom_main_button.dart';
import 'camera_recorde.dart';

class AllMySigns extends StatelessWidget {
  const AllMySigns({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: AppTextButton(
          backgroundColor: Color(0xff676BFF),
          buttonText: 'Record New Sign',
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffF9FCFF),
          ),
          onPressed: () {
            context.pushNamed(Routes.RecordSign);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24.r),
            decoration: BoxDecoration(
              color: Color(0xff676BFF),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                verticalSpace(70.h),
                Column(
                  children: [
                    Row(
                      children: [
                        verticalSpace(50.h),
                        GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Image.asset('assets/images/arrow1.png')),
                        horizontalSpace(16.w),
                        Text(
                          'My Signs ',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(

                        '6 saved GIFs',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: .72,

                ),
                itemBuilder: (context,index){
                  return QuickSigns(appear: true,);
                },

              ),
            ),
          )

        ],
      ),
    );
  }
}
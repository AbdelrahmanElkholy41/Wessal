import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/widgets/coutom_text_field.dart';
import 'package:wesal/core/widgets/custom_main_button.dart';
import 'package:wesal/feature/home/ui/widget/quick_sings.dart';

import '../../../core/helpers/spacing.dart';

class SaveSign extends StatelessWidget {
  const SaveSign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: AppTextButton(
          backgroundColor: Color(0xff676BFF),
          buttonText: 'Save GIF',
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xffF9FCFF),
          ),
          onPressed: () {
            (

            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                ],
              ),
            ),
            verticalSpace(16.h),
            Center(
              child: SizedBox(
                width: 300.w,
                height: 200.h,
                child: QuickSigns(appear: false),
              ),
            ),
            verticalSpace(35.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Sign Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff094173),
                ),
              ),
            ),
            verticalSpace(16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: CustomTextField(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.r),
                  
                  borderSide: BorderSide(
                    color: Color(0xff676BFF)
                        
                  )
                    
                      
                ),
                hintText: '#e.g. Hello, Thank You',
                validator: (vale) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

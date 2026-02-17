import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/widgets/coutom_text_field.dart';
import '../../onBoarding/ui/widget/custom_app_bar.dart';

class CompleteSigup extends StatelessWidget {
  const CompleteSigup({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16.h),
              Text(
                'Set up your profile',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xff676BFF),
                ),
              ),
              verticalSpace(16.h),
              Center(child: Image.asset('assets/images/woman.png')),
              verticalSpace(24.h),
              CustomTextField(
                hintText: 'Enter your phone number',
                validator: (value) {},

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff676BFF)),
                ),
              ),
              verticalSpace(16.h),
              CustomTextField(
                hintText: 'Date of Birth',
                validator: (value) {},
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff676BFF)),
                ),
              ),
              verticalSpace(16.h),
              CustomTextField(
                hintText: 'Family Contact Number',
                validator: (value) {},
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Color(0xff676BFF)),
                ),
              ),
              verticalSpace(16.h),
              Text('Are you specially abled',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xff094173)),),
              verticalSpace(16.h),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {},shape: CircleBorder(),),
                  Text('Yes',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                ],

              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {},shape: CircleBorder(),side: BorderSide(
                    color: Color(0xff676BFF),
                  ),),
                  Text('No',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
                ],
              )


            ],
          ),
        ),
      ),
    );
  }
}

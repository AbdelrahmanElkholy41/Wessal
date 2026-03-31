import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';

class AppBarFavoritSign extends StatelessWidget {
  const AppBarFavoritSign({

    super.key,
    required this.name, required this.appear,
  });

final bool appear;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    name ?? 'My Signs',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              appear ?
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
              ): SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
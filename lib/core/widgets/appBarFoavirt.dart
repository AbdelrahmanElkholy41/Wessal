import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/spacing.dart';

class AppBarFavoritSign extends StatelessWidget {
  const AppBarFavoritSign({

    super.key,
    required this.name, required this.appear, required this.appearDec, this.dec,
  });

final bool appear;
final bool appearDec;
  final String? name;
  final String? dec;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.r),
      decoration: BoxDecoration(
        color: Color(0xff676BFF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(80.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Image.asset('assets/images/arrow1.png'),
                  ),
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
              if (appearDec) ...[
                verticalSpace(5.h),
                Padding(
                  padding: EdgeInsets.only(left: 50.w), // ← محاذاة تحت العنوان
                  child: Text(
                    dec ?? 'Pick a story to read and learn!',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
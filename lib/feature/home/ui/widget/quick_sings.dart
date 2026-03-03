import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuickSigns extends StatelessWidget {
  const QuickSigns({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 280.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        image: const DecorationImage(
          image: AssetImage('assets/images/woman1.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 12.h,
            left: 12.w,
            child: _circleIcon(Icons.star_border_purple500_sharp),
          ),
          Positioned(
            top: 12.h,
            right: 12.w,
            child: _circleIcon(Icons.more_vert),
          ),
          Center(child: Image.asset('assets/images/Gif.png', width: 90.w)),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.deepPurple.withOpacity(0.85),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                "Hello",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _circleIcon(IconData icon) {
  return Container(
    padding: EdgeInsets.all(8.r),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.black.withOpacity(0.3),
    ),
    child: Icon(icon, color: Colors.white, size: 22.sp),
  );
}

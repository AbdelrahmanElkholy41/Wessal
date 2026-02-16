
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import 'onboarding1.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Onboarding1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          verticalSpace(177.h),
            Image.asset('assets/images/logo.png',),
          const Spacer(),

          ClipPath(
            clipper: BigCircleClipper(),
            child: Container(
              width: double.infinity,
              height: 350,
              color: const Color(0xFF6C6CFF),
            ),
          )


        ],
      ),
    );

  }
}

class BigCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // نبدأ من تحت شمال
    path.moveTo(0, size.height);

    // نطلع فوق
    path.lineTo(0, size.height * 0.5);

    // القوس الكبير (سر الشكل)
    path.arcToPoint(
      Offset(size.width, size.height * 0.05),
      radius: Radius.circular(size.width * .9),
      clockwise: false,
    );

    // نكمل باقي المستطيل
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



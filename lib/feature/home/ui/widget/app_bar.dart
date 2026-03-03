import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';

class AppBarr extends StatelessWidget {
  const AppBarr({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff676BFF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          verticalSpace(70.h),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24.0,
                  bottom: 16,
                  right: 8,
                ),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/fadya.png'),
                ),
              ),
              Text(
                'Hi, Hend',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Color(0xffF9FCFF),
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

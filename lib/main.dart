import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },

    );
  }
}
echo "# Wessal" README.md
git
git
git
git
git
git
init
add README .md
comit -m "first comit"
branch -M main
remte add origin https://github.com/AbdelrahmanElkholy41/Wessal.git
push -u origin main

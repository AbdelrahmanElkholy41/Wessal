import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/spacing.dart';
import 'package:wesal/feature/learn/ui/widget/app_bar_learnFeature.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarLearn(),
            verticalSpace(20.h),
            const Text(
              "Your Progress",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const Text(
              "Look how much you've learned!",
              style: TextStyle(color: Colors.blue),
            ),

            verticalSpace(15.h),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(Icons.star, color: Colors.yellow),

                  const Text(
                    "Level 2",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const Text("150 points to next level!"),

                  const SizedBox(height: 10),

                  LinearProgressIndicator(
                    value: 0.6,
                    borderRadius: BorderRadius.circular(20),
                    minHeight: 14,
                  ),
                ],
              ),
            ),

            verticalSpace(20.h),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Image.asset('assets/images/book.png'),
                  const SizedBox(width: 15),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ASL Dictionary",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          "Your guide to ASL, with signs shown through videos and examples",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            verticalSpace(20.h),

            /// STATS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: statCard(
                      title: "Stories Read",
                      value: "8/12",
                      percent: 0.67,
                      image: 'assets/images/book2.png',
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: statCard(
                      title: "Signs Learned",
                      value: "24/48",
                      percent: 0.50,
                      image: 'assets/images/hand.png',
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

Widget statCard({
  required String title,
  required String value,
  required double percent,
  required String image,
}) {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: [
        Image.asset(image),
        verticalSpace(10.h),

        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        verticalSpace(10.h),
        Text(value),
        verticalSpace(10.h),
        LinearProgressIndicator(
          value: percent,
          borderRadius: BorderRadius.circular(20),
          minHeight: 10,
        ),
      ],
    ),
  );
}

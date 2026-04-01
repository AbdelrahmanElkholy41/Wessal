import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/spacing.dart';

import '../../../core/widgets/appBarFoavirt.dart';
import '../data/dic_modal.dart';

class SignDetailsScreen extends StatelessWidget {
  final SignModel sign;

  const SignDetailsScreen({super.key, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FB),
      body: Column(
        children: [
          AppBarFavoritSign(name: sign.title, appear: false,),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Video Tutorial",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  verticalSpace(12.h),

                  _buildVideo(),

                  verticalSpace(20.h),

                  _buildSectionTitle("Usage Example"),
                  Text(
                    sign.description,
                    style: const TextStyle(color: Colors.grey),
                  ),

                 verticalSpace(16.h),

                  _buildSectionTitle("How to Sign"),
                  const Text(
                    "Open your hand with fingers together, place it near your forehead, then move it outward.",
                    style: TextStyle(color: Colors.grey),
                  ),

                  verticalSpace(16.h),

                  _buildSectionTitle("Tips for Practice"),
                  _buildTips(),

                  verticalSpace(20.h),

                  _buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ─── Header ─────────────────────────────────────────────

  // ─── Video ─────────────────────────────────────────────
  Widget _buildVideo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            sign.image,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.play_arrow, size: 32),
          )
        ],
      ),
    );
  }
    Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildTips() {
    return Column(
      children: const [
        TipItem(number: 1, text: "Keep your palm facing outward"),

        TipItem(number: 2, text: "Movement should be smooth"),
        TipItem(number: 3, text: "Make eye contact while signing"),
      ],
    );
  }

  // ─── Buttons ───────────────────────────────────────────
  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text("Add to Favourite"),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5B5FE8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
            ),
            child: const Text("Mark as Learned", style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

// ─── Tip Item Widget ─────────────────────────────────────
class TipItem extends StatelessWidget {
  final int number;
  final String text;

  const TipItem({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 10,
            backgroundColor: const Color(0xFF5B5FE8),
            child: Text(
              number.toString(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          horizontalSpace(8.w),
          Expanded(child: Text(text)),


        ],
      ),
    );
  }
}
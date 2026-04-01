// lib/widgets/sign_word_card.dart

import 'package:flutter/material.dart';
import '../../../../core/theming/app_theme.dart';
import '../../logic/models/story_page.dart';

class SignWordCard extends StatelessWidget {
  final SignWord sign;

  const SignWordCard({super.key, required this.sign});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            // Photo background
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    _cardColor(sign.word).withOpacity(0.85),
                    _cardColor(sign.word),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  sign.signEmoji,
                  style: const TextStyle(fontSize: 52),
                ),
              ),
            ),
            // Star icon top-left
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.25),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.star_border_rounded,
                  color: AppColors.white,
                  size: 18,
                ),
              ),
            ),
            // GIF badge top-right
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'GIF',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
            // Word label at bottom
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: AppColors.cardBg,
                child: Text(
                  sign.word,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: AppColors.textDark,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _cardColor(String word) {
    final colors = [
      const Color(0xFF3DBFB8), // teal
      const Color(0xFF7B6FEF), // purple
      const Color(0xFF5B9EF0), // blue
      const Color(0xFFE87040), // orange
      const Color(0xFF56C490), // green
    ];
    return colors[word.hashCode % colors.length];
  }
}

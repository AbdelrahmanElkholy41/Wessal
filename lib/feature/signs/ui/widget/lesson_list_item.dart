// lib/feature/signs/ui/widgets/lesson_list_item.dart

import 'package:flutter/material.dart';
import '../../../../core/theming/app_theme.dart';
import '../../data/models/sign_level.dart';

class LessonListItem extends StatelessWidget {
  final SignLesson lesson;
  final VoidCallback onTap;

  const LessonListItem({super.key, required this.lesson, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Play icon box
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: AppColors.primaryLight,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.play_arrow_rounded,
                color: AppColors.primary,
                size: 28,
              ),
            ),
            const SizedBox(width: 14),
            // Title & subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lesson.title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    lesson.subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Checkmark
            if (lesson.isCompleted)
              const Icon(
                Icons.check_rounded,
                color: AppColors.primary,
                size: 24,
              )
            else
              const Icon(
                Icons.lock_outline_rounded,
                color: AppColors.textGrey,
                size: 20,
              ),
          ],
        ),
      ),
    );
  }
}

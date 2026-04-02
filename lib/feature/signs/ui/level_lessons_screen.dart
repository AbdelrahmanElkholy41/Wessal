// lib/feature/signs/ui/screens/level_lessons_screen.dart

import 'package:flutter/material.dart';
import 'package:wesal/core/widgets/appBarFoavirt.dart';
import 'package:wesal/feature/signs/ui/widget/lesson_list_item.dart';
import '../../../core/theming/app_theme.dart';
import '../data/models/sign_level.dart';
import 'lesson_detail_screen.dart';

class LevelLessonsScreen extends StatelessWidget {
  final SignLevel level;

  const LevelLessonsScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // App bar
         AppBarFavoritSign(name: level.name, appear: false),
          // Lessons List title
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 24, 20, 16),
            child: Text(
              'Lessons List',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: AppColors.textDark,
              ),
            ),
          ),
          // List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              itemCount: level.lessons.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final lesson = level.lessons[index];
                return LessonListItem(
                  lesson: lesson,
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => LessonDetailScreen(
                        lesson: lesson,
                        levelName: level.name,
                        allLessons: level.lessons,
                        initialIndex: index,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


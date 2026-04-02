// lib/feature/signs/ui/screens/lesson_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:wesal/core/widgets/appBarFoavirt.dart';

import '../../../core/theming/app_theme.dart';
import '../data/models/sign_level.dart';

class LessonDetailScreen extends StatefulWidget {
  final SignLesson lesson;
  final String levelName;
  final List<SignLesson> allLessons;
  final int initialIndex;

  const LessonDetailScreen({
    super.key,
    required this.lesson,
    required this.levelName,
    required this.allLessons,
    required this.initialIndex,
  });

  @override
  State<LessonDetailScreen> createState() => _LessonDetailScreenState();
}

class _LessonDetailScreenState extends State<LessonDetailScreen> {
  late int _currentIndex;
  late SignLesson _currentLesson;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _currentLesson = widget.allLessons[_currentIndex];
  }

  void _goNext() {
    if (_currentIndex < widget.allLessons.length - 1) {
      setState(() {
        _currentIndex++;
        _currentLesson = widget.allLessons[_currentIndex];
      });
    }
  }

  void _goPrevious() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _currentLesson = widget.allLessons[_currentIndex];
      });
    }
  }

  void _markCompleted() {
    setState(() => _currentLesson.isCompleted = true);
  }

  @override
  Widget build(BuildContext context) {
    final isFirst = _currentIndex == 0;
    final isLast = _currentIndex == widget.allLessons.length - 1;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // App bar
          AppBarFavoritSign(name: widget.levelName, appear: false),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Lesson Details',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Video player placeholder
                  _VideoPlaceholder(),
                  const SizedBox(height: 20),
                  // Lesson title
                  Text(
                    '${_currentLesson.title}: ${_currentLesson.subtitle}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Mark as completed button
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _currentLesson.isCompleted ? null : _markCompleted,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _currentLesson.isCompleted
                            ? AppColors.primaryLight
                            : AppColors.primary,
                        foregroundColor: _currentLesson.isCompleted
                            ? AppColors.primary
                            : AppColors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentLesson.isCompleted ? '✓ Completed' : 'Mark as Completed',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom navigation
          _BottomNav(
            isFirst: isFirst,
            isLast: isLast,
            onPrevious: _goPrevious,
            onNext: _goNext,
          ),
        ],
      ),
    );
  }
}


class _VideoPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 210,
      decoration: BoxDecoration(
        color: AppColors.primaryLight,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Center(
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow_rounded,
            color: AppColors.white,
            size: 36,
          ),
        ),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  final bool isFirst;
  final bool isLast;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _BottomNav({
    required this.isFirst,
    required this.isLast,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(28, 16, 28, 36),
      decoration: BoxDecoration(
        color: AppColors.background,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: isFirst ? null : onPrevious,
            child: Text(
              'Previous',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isFirst ? AppColors.textGrey : AppColors.textDark,
              ),
            ),
          ),
          GestureDetector(
            onTap: isLast ? null : onNext,
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: isLast ? AppColors.textGrey : AppColors.textDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

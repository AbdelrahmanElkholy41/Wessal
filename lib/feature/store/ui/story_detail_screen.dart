// lib/screens/story_detail_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wesal/core/helpers/spacing.dart';
import 'package:wesal/feature/store/ui/widget/sign_word_card.dart';
import 'package:wesal/feature/store/ui/widget/story_image_card.dart';
import '../../../core/theming/app_theme.dart';
import '../data/models/story.dart';
import '../data/models/story_page.dart';
import 'feedback_screen.dart';

class StoryDetailScreen extends StatefulWidget {
  final Story story;

  const StoryDetailScreen({super.key, required this.story});

  @override
  State<StoryDetailScreen> createState() => _StoryDetailScreenState();
}

class _StoryDetailScreenState extends State<StoryDetailScreen> {
  int _currentPage = 0;
  late final List<StoryPage> _pages;

  @override
  void initState() {
    super.initState();
    _pages = StoryPageData.getPages(widget.story.id);
  }

  void _goNext() {
    if (_currentPage < _pages.length - 1) {
      setState(() => _currentPage++);
    } else {
      // لما نوصل آخر صفحة، افتح FeedbackScreen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => FeedbackScreen(storyTitle: widget.story.title),
        ),
      );
    }
  }

  void _goPrevious() {
    if (_currentPage > 0) {
      setState(() => _currentPage--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _DetailAppBar(
            title: widget.story.title,
            currentPage: _currentPage,
            totalPages: _pages.length,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(24.h),
                  StoryImageCard(page: page),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Learn these signs:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w900,
                        color: AppColors.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  // Signs as horizontal row of cards
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: page.signs.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (_, i) => SignWordCard(sign: page.signs[i]),
                    ),
                  ),
                ],
              ),
            ),
          ),
          _NavigationBar(
            currentPage: _currentPage,
            totalPages: _pages.length,
            onPrevious: _goPrevious,
            onNext: _goNext,
          ),
        ],
      ),
    );
  }
}

class _DetailAppBar extends StatelessWidget {
  final String title;
  final int currentPage;
  final int totalPages;

  const _DetailAppBar({
    required this.title,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    final progress = (currentPage + 1) / totalPages;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
          child: Column(
            children: [
              verticalSpace(80.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white.withOpacity(0.5),
                          width: 1.5,
                        ),
                      ),
                      child: const Icon(

                        Icons.chevron_left_rounded,
                        color: AppColors.white,
                        size: 26,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              // Animated progress bar
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: [
                    // Track
                    Container(
                      height: 5,
                      width: double.infinity,
                      color: AppColors.white.withOpacity(0.25),
                    ),
                    // Fill
                    AnimatedFractionallySizedBox(
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeInOut,
                      widthFactor: progress,
                      child: Container(
                        height: 5,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  const _NavigationBar({
    required this.currentPage,
    required this.totalPages,
    required this.onPrevious,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final isFirst = currentPage == 0;
    final isLast = currentPage == totalPages - 1;

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
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
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 13),
              decoration: BoxDecoration(
                color: isFirst ? AppColors.cardBg : AppColors.background,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: isFirst ? AppColors.cardBg : AppColors.primary.withOpacity(0.5),
                  width: 1.5,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.chevron_left_rounded,
                      color: isFirst ? AppColors.textGrey : AppColors.primary, size: 22),
                  const SizedBox(width: 4),
                  Text('Previous',
                      style: TextStyle(
                        color: isFirst ? AppColors.textGrey : AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: onNext,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 13),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                children: [
                  Text(isLast ?'Finish':'Next',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      )),
                  const SizedBox(width: 4),
                  Icon(Icons.chevron_right_rounded,
                      color: AppColors.white, size: 22),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

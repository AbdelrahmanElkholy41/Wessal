// lib/screens/feedback_screen.dart

import 'package:flutter/material.dart';
import 'package:wesal/core/widgets/appBarFoavirt.dart';

import '../../../core/theming/app_theme.dart';

enum EnjoyRating { happy, surprised, sad }

enum FeedbackReason { funny, easyToUnderstand, tooFast, other }

class FeedbackScreen extends StatefulWidget {
  final String storyTitle;

  const FeedbackScreen({super.key, required this.storyTitle});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  EnjoyRating? _selectedRating;
  FeedbackReason? _selectedReason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
         AppBarFavoritSign(name: 'Did you enjoy this story ?', appear: false,),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 28),
                  // Emoji rating row
                  _EmojiRatingRow(
                    selected: _selectedRating,
                    onSelect: (r) => setState(() => _selectedRating = r),
                  ),
                  const SizedBox(height: 36),
                  // Why label
                  const Text(
                    'Why ?',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Reason grid
                  _ReasonGrid(
                    selected: _selectedReason,
                    onSelect: (r) => setState(() => _selectedReason = r),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
          // Submit button
          _SubmitButton(
            enabled: _selectedRating != null,
            onSubmit: () => Navigator.of(context)
                .popUntil((route) => route.isFirst),
          ),
        ],
      ),
    );
  }
}

// ── App Bar ───────────────────────────────────────────────

// ── Emoji Rating Row ──────────────────────────────────────
class _EmojiRatingRow extends StatelessWidget {
  final EnjoyRating? selected;
  final ValueChanged<EnjoyRating> onSelect;

  const _EmojiRatingRow({required this.selected, required this.onSelect});

  static const _items = [
    (EnjoyRating.happy, '😊'),
    (EnjoyRating.surprised, '😮'),
    (EnjoyRating.sad, '😢'),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _items.map((item) {
        final (rating, emoji) = item;
        final isSelected = selected == rating;
        return GestureDetector(
          onTap: () => onSelect(rating),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: 68,
            height: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? AppColors.primary.withOpacity(0.15)
                  : Colors.transparent,
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 2.5)
                  : null,
            ),
            child: Center(
              child: Text(
                emoji,
                style: TextStyle(
                  fontSize: isSelected ? 44 : 38,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Reason Grid ───────────────────────────────────────────
class _ReasonGrid extends StatelessWidget {
  final FeedbackReason? selected;
  final ValueChanged<FeedbackReason> onSelect;

  const _ReasonGrid({required this.selected, required this.onSelect});

  static const _items = [
    (FeedbackReason.funny, '🤩', 'Funny'),
    (FeedbackReason.easyToUnderstand, '🤎', 'Easy to\nunderstand'),
    (FeedbackReason.tooFast, '🟪', 'Too Fast'),
    (FeedbackReason.other, '💭', 'Other'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 14,
      crossAxisSpacing: 14,
      childAspectRatio: 1.15,
      children: _items.map((item) {
        final (reason, emoji, label) = item;
        final isSelected = selected == reason;
        return GestureDetector(
          onTap: () => onSelect(reason),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary.withOpacity(0.15)
                  : AppColors.cardBg,
              borderRadius: BorderRadius.circular(20),
              border: isSelected
                  ? Border.all(color: AppColors.primary, width: 2)
                  : Border.all(color: Colors.transparent, width: 2),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.07),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(emoji, style: const TextStyle(fontSize: 36)),
                const SizedBox(height: 10),
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: isSelected ? AppColors.primary : AppColors.textDark,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// ── Submit Button ─────────────────────────────────────────
class _SubmitButton extends StatelessWidget {
  final bool enabled;
  final VoidCallback onSubmit;

  const _SubmitButton({required this.enabled, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: GestureDetector(
        onTap: enabled ? onSubmit : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            color: enabled ? AppColors.primary : AppColors.primaryLight,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Text(
              'Submit',
              style: TextStyle(
                color: enabled ? AppColors.white : AppColors.primary,
                fontSize: 17,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

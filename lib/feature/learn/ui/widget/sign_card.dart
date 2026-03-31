import 'package:flutter/material.dart';
import '../../logic/dic_modal.dart';

class SignCard extends StatelessWidget {
  final SignModel sign;
  final bool isLearned;
  final bool isFavorite;
  final VoidCallback onToggleLearned;
  final VoidCallback onToggleFavorite;

  const SignCard({
    super.key,
    required this.sign,
    required this.isLearned,
    required this.isFavorite,
    required this.onToggleLearned,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    final catColor =
        kCategoryColors[sign.category] ?? const Color(0xFF6C7BFF);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImageArea(catColor),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    sign.title,
                    style: const TextStyle(
                      color: Color(0xFF5B5FE8),
                      fontWeight: FontWeight.w800,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Expanded(
                    child: Text(
                      sign.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Color(0xFF888888),
                        fontSize: 11,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  _buildButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageArea(Color catColor) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
            color: sign.bgColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -20,
                right: -20,
                child: Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.12),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 15,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.08),
                  ),
                ),
              ),
              Center(
                child:ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    sign.image,
                    width: double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: catColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              sign.category,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Positioned(
          top: 8,
          right: 8,
          child: GestureDetector(
            onTap: onToggleFavorite,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.85),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Icon(
                isFavorite ? Icons.star_rounded : Icons.star_border_rounded,
                color: isFavorite ? Colors.amber : const Color(0xFF888888),
                size: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButtons() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onToggleLearned,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                color:
                isLearned ? const Color(0xFF5B5FE8) : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: isLearned
                    ? null
                    : Border.all(
                  color: const Color(0xFF5B5FE8),
                  width: 1.5,
                ),
              ),
              child: Text(
                isLearned ? '✓ Learned' : 'Mark as Learned',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isLearned ? Colors.white : const Color(0xFF5B5FE8),
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFCCCCCC), width: 1.5),
          ),
          child: const Icon(
            Icons.info_outline_rounded,
            size: 14,
            color: Color(0xFF888888),
          ),
        ),
      ],
    );
  }
}
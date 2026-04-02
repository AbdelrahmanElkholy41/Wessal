// lib/feature/signs/ui/screens/signs_screen.dart

import 'package:flutter/material.dart';
import 'package:wesal/feature/signs/ui/widget/level_card.dart';
import '../../../core/theming/app_theme.dart';
import '../../../core/widgets/app_bar_withSearch.dart';
import '../data/models/sign_level.dart';
import 'level_lessons_screen.dart';

class SignsScreen extends StatefulWidget {
  const SignsScreen({super.key});

  @override
  State<SignsScreen> createState() => _SignsScreenState();
}

class _SignsScreenState extends State<SignsScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  List<SignLevel> get _filteredLevels {
    if (_query.isEmpty) return SignLevelData.levels;
    return SignLevelData.levels
        .where((l) => l.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // ── App Bar ──────────────────────────────────
          SliverToBoxAdapter(
            child: AppBarWitrhSearch(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          // ── Placement Test Banner ────────────────────
          const SliverToBoxAdapter(child: _PlacementTestBanner()),
          // ── Levels List ──────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final level = _filteredLevels[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: LevelCard(
                      level: level,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => LevelLessonsScreen(level: level),
                        ),
                      ),
                    ),
                  );
                },
                childCount: _filteredLevels.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── App Bar ───────────────────────────────────────────

// ── Placement Test Banner ─────────────────────────────
class _PlacementTestBanner extends StatelessWidget {
  const _PlacementTestBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.08),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Illustration
          Container(
            height: 90,
            child: const Center(
              child: Text('📋', style: TextStyle(fontSize: 64)),
            ),
          ),
          const SizedBox(height: 12),
          const Text(
            'PLACEMENT TEST',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: AppColors.textDark,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Know your current level and start from the right place.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: AppColors.textGrey,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Start test',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

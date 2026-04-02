import 'package:flutter/material.dart';
import 'package:wesal/feature/learn/ui/widget/app_bar_learnFeature.dart';
import 'package:wesal/feature/learn/ui/widget/asl_widget.dart';
import 'package:wesal/feature/learn/ui/widget/sign_card.dart';

import '../data/dic_modal.dart';


class ASLDictionaryScreen extends StatefulWidget {
  const ASLDictionaryScreen({super.key});

  @override
  State<ASLDictionaryScreen> createState() => _ASLDictionaryScreenState();
}

class _ASLDictionaryScreenState extends State<ASLDictionaryScreen> {
  String _activeCategory = 'All';
  String _searchQuery = '';
  final Set<int> _learnedIds = {};
  final Set<int> _favoriteIds = {};
  final TextEditingController _searchController = TextEditingController();

  List<SignModel> get _filteredSigns {
    return kSigns.where((sign) {
      final matchCat =
          _activeCategory == 'All' || sign.category == _activeCategory;
      final matchSearch = sign.title.toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
      return matchCat && matchSearch;
    }).toList();
  }



  void _toggleLearned(int id) {
    setState(() {
      if (_learnedIds.contains(id)) {
        _learnedIds.remove(id);
      } else {
        _learnedIds.add(id);
      }
    });
  }

  void _toggleFavorite(int id) {
    setState(() {
      if (_favoriteIds.contains(id)) {
        _favoriteIds.remove(id);
      } else {
        _favoriteIds.add(id);
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppBarLearn(
              starApp: false,
              title: 'ASL Dictionary',
              dec:
                  'Learn about the signs and how to use them accurately and easily',
            ),
          ),
          SliverToBoxAdapter(
            child: CategoryTabs(
              activeCategory: _activeCategory,
              onCategorySelected: (cat) =>
                  setState(() => _activeCategory = cat),
            ),
          ),
          if (_learnedIds.isNotEmpty)
            SliverToBoxAdapter(
              child: ProgressBar(
                learned: _learnedIds.length,
                total: kSigns.length,
              ),
            ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 14, 16, 24),
            sliver: _filteredSigns.isEmpty
                ? const SliverToBoxAdapter(child: EmptyState())
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final sign = _filteredSigns[index];
                      return SignCard(
                        sign: sign,
                        isLearned: _learnedIds.contains(sign.id),
                        isFavorite: _favoriteIds.contains(sign.id),
                        onToggleLearned: () => _toggleLearned(sign.id),
                        onToggleFavorite: () => _toggleFavorite(sign.id),
                      );
                    }, childCount: _filteredSigns.length),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: 0.62,
                        ),
                  ),
          ),
        ],
      ),
    );
  }
}

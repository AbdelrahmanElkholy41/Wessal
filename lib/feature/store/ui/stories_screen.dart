// lib/screens/stories_screen.dart

import 'package:flutter/material.dart';
import 'package:wesal/feature/store/ui/widget/story_card.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/app_theme.dart';
import '../../../core/widgets/appBarFoavirt.dart';
import '../data/models/story.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppBarFavoritSign(
              name: 'Choose a Story',
              appearDec: true,
              appear: false,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                final story = StoryData.stories[index];
                return StoryCard(
                  story: story,
                  onTap: () {
                    Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pushNamed(Routes.storyDetails, arguments: story);
                  },
                );
              }, childCount: StoryData.stories.length),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.78,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

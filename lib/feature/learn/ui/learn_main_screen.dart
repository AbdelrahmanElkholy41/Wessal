import 'package:flutter/material.dart';

import 'learn_screen.dart';

class LearningMainScreen extends StatefulWidget {
  const LearningMainScreen({super.key});

  @override
  State<LearningMainScreen> createState() => _LearningMainScreenState();
}

class _LearningMainScreenState extends State<LearningMainScreen> {
  int currentIndex = 0;

  final List<GlobalKey<NavigatorState>> navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: List.generate(4, (index) {
          return Offstage(
            offstage: currentIndex != index,
            child: Navigator(
              key: navigatorKeys[index],
              onGenerateRoute: (_) {
                return MaterialPageRoute(
                  builder: (_) => _getRootScreen(index),
                );
              },
            ),
          );
        }),
      ),

      bottomNavigationBar: _buildNavBar(),
    );
  }

  Widget _getRootScreen(int index) {
    switch (index) {
      case 0:
        return const LearnScreen();
      case 1:
        return const SignsScreen();
      case 2:
        return const StoriesScreen();
      case 3:
        return const GamesScreen();
      default:
        return const SizedBox();
    }
  }

  Widget _buildNavBar() {
    final icons = [
      Icons.home,
      Icons.pan_tool,
      Icons.menu_book,
      Icons.sports_esports,
    ];

    final labels = ["Home", "Signs", "Stories", "Games"];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          gradient: const LinearGradient(
            colors: [Color(0xff6C63FF), Color(0xff5A5DE6)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (index) {
            final isSelected = currentIndex == index;

            return GestureDetector(
              onTap: () {
                if (currentIndex == index) {
                  navigatorKeys[index]
                      .currentState!
                      .popUntil((route) => route.isFirst);
                } else {
                  setState(() {
                    currentIndex = index;
                  });
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 16 : 10,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      color:
                      isSelected ? Colors.deepPurple : Colors.white,
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      Text(
                        labels[index],
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

/// Tabs مؤقتة
class SignsScreen extends StatelessWidget {
  const SignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Signs")),
      body: const Center(child: Text("Signs Screen")),
    );
  }
}

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stories")),
      body: const Center(child: Text("Stories Screen")),
    );
  }
}

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Games")),
      body: const Center(child: Text("Games Screen")),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../learn/ui/learn_screen.dart';
import '../home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeContent(),
    const Center(child: Text("meet")),
    const Center(child: Text("Search")),
    LearnScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24),
        child: currentIndex == 3
            ? buildLearningNavBar()
            : buildDefaultNavBar(),
      ),

    );
  }
  Widget buildDefaultNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
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

          final icons = [
            Icons.home,
            Icons.videocam_sharp,
            Icons.people_alt_rounded,
            Icons.menu_book_outlined,
          ];

          final labels = ["Home", "Meetings", "Community", "Learning"];

          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.symmetric(
                horizontal: isSelected ? 16 : 0,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: isSelected ? Colors.deepPurple : Colors.white,
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
    );
  }
  Widget buildLearningNavBar() {
    final icons = [
      Icons.home,
      Icons.pan_tool,
      Icons.menu_book,
      Icons.sports_esports,
    ];

    final labels = ["Home", "Signs", "Stories", "Games"];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
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
              setState(() {
                currentIndex = index;
              });
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

                  /// 👇 الاسم يظهر بس لما يتحدد
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
    );
  }
}

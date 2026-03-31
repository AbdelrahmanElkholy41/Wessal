import 'package:flutter/material.dart';

class SignModel {
  final int id;
  final String title;
  final String category;
  final String description;
  final Color bgColor;
  final String image;

  const SignModel({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.bgColor,
    required this.image,
  });
}

// ─── Constants ────────────────────────────────────────────────
const List<String> kCategories = [
  'All',
  'Greetings',
  'Common Phrases',
  'Emotions',
  'Relationships',
];

const Map<String, Color> kCategoryColors = {
  'Greetings': Color(0xFF4CAF9A),
  'Common Phrases': Color(0xFFE05A5A),
  'Emotions': Color(0xFF9C6BB5),
  'Relationships': Color(0xFFE08A2E),
};

final List<SignModel> kSigns = [
  const SignModel(
      id: 1,
      title: 'Hello',
      category: 'Greetings',
      description:
      "A common greeting used to acknowledge someone's presence or to begin a conversation.",
      bgColor: Color(0xFF4CAF9A),
      image: 'assets/images/sign-hello.png'),
  const SignModel(
      id: 2,
      title: 'Thank You',
      category: 'Common Phrases',
      description: 'An expression of gratitude used to show appreciation.',
      bgColor: Color(0xFFE05A5A),
      image:'assets/images/sign-thankyou.png'),
  const SignModel(
      id: 3,
      title: 'Love',
      category: 'Emotions',
      description:
      'Expresses deep affection, care, or romantic feelings toward someone.',
      bgColor: Color(0xFF9C6BB5),
      image: 'assets/images/sign-thankyou.png'),
  const SignModel(
      id: 4,
      title: 'Help',
      category: 'Common Phrases',
      description: 'Used to request or offer assistance.',
      bgColor: Color(0xFF4CAF9A),
      image: 'assets/images/sign-thankyou.png'),
  const SignModel(
      id: 5,
      title: 'Family',
      category: 'Relationships',
      description: 'Refers to a group of people related by blood or marriage.',
      bgColor: Color(0xFFE08A2E),
      image: 'assets/images/sign-hello.png'),
  const SignModel(
      id: 6,
      title: 'Sorry',
      category: 'Common Phrases',
      description: 'An expression used to apologize or show regret.',
      bgColor: Color(0xFFE05A5A),
      image: 'assets/images/sign-hello.png'),
  const SignModel(
      id: 7,
      title: 'Happy',
      category: 'Emotions',
      description: 'Conveys a feeling of joy or contentment.',
      bgColor: Color(0xFF9C6BB5),
      image: 'assets/images/sign-hello.png'),
  const SignModel(
      id: 8,
      title: 'Friend',
      category: 'Relationships',
      description: 'Refers to a person with whom you share mutual affection.',
      bgColor: Color(0xFFE08A2E),
      image: 'assets/images/sign-hello.png'),
  const SignModel(
      id: 9,
      title: 'Please',
      category: 'Common Phrases',
      description: 'Used to make a polite request.',
      bgColor: Color(0xFFE05A5A),
      image: 'assets/images/sign-hello.png'),
  const SignModel(
      id: 10,
      title: 'Sad',
      category: 'Emotions',
      description: 'Conveys a feeling of sorrow or unhappiness.',
      bgColor: Color(0xFF9C6BB5),
      image: 'assets/images/sign-hello.png'),
];
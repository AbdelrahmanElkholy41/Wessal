// lib/models/story_page.dart

class StoryPage {
  final int pageNumber;
  final int totalPages;
  final String caption;
  final String imageEmoji; // placeholder for image
  final List<SignWord> signs;

  const StoryPage({
    required this.pageNumber,
    required this.totalPages,
    required this.caption,
    required this.imageEmoji,
    required this.signs,
  });
}

class SignWord {
  final String word;
  final String signEmoji;
  final String description;

  const SignWord({
    required this.word,
    required this.signEmoji,
    required this.description,
  });
}

class StoryPageData {
  static const Map<String, List<StoryPage>> pages = {
    '1': [
      StoryPage(
        pageNumber: 1,
        totalPages: 3,
        caption: 'This is Whiskers, a very happy cat!',
        imageEmoji: 'assets/images/cat.png',
        signs: [
          SignWord(word: 'Cat', signEmoji: 'assets/images/cat.png', description: 'Pinch fingers near cheek'),
          SignWord(word: 'Happy', signEmoji: 'assets/images/cat.png', description: 'Brush chest upward'),
        ],
      ),
      StoryPage(
        pageNumber: 2,
        totalPages: 3,
        caption: 'Whiskers loves to play with yarn.',
        imageEmoji: 'assets/images/cat.png',
        signs: [
          SignWord(word: 'Play', signEmoji: 'assets/images/cat.png', description: 'Wiggle both hands'),
          SignWord(word: 'Love', signEmoji: 'assets/images/cat.png', description: 'Cross arms on chest'),
        ],
      ),
      StoryPage(
        pageNumber: 3,
        totalPages: 3,
        caption: 'At night, Whiskers sleeps peacefully.',
        imageEmoji: 'assets/images/cat.png',
        signs: [
          SignWord(word: 'Sleep', signEmoji: 'assets/images/cat.png', description: 'Tilt head on hand'),
          SignWord(word: 'Night', signEmoji: 'assets/images/cat.png', description: 'Arc hand downward'),
        ],
      ),
    ],
    '2': [
      StoryPage(
        pageNumber: 1,
        totalPages: 3,
        caption: 'Thomas Gallaudet was a great teacher.',
        imageEmoji: 'assets/images/cat.png',
        signs: [
          SignWord(word: 'Teacher', signEmoji: 'assets/images/cat.png', description: 'Flat hands from temples outward'),
          SignWord(word: 'Great', signEmoji: 'assets/images/cat.png', description: 'Thumbs up with both hands'),
        ],
      ),
      StoryPage(
        pageNumber: 2,
        totalPages: 3,
        caption: 'Whiskers loves to play with yarn.',
        imageEmoji: 'assets/images/cat.png',
        signs: [
          SignWord(word: 'Play', signEmoji: 'assets/images/cat.png', description: 'Wiggle both hands'),
          SignWord(word: 'Love', signEmoji: 'assets/images/cat.png', description: 'Cross arms on chest'),
        ],
      ),
      StoryPage(
        pageNumber: 3,
        totalPages: 3,
        caption: 'At night, Whiskers sleeps peacefully.',
        imageEmoji: 'assets/images/cat.png',
        signs: [
          SignWord(word: 'Sleep', signEmoji: 'assets/images/cat.png', description: 'Tilt head on hand'),
          SignWord(word: 'Night', signEmoji: 'assets/images/cat.png', description: 'Arc hand downward'),
        ],
      ),

    ],
  };

  static List<StoryPage> getPages(String storyId) {
    return pages[storyId] ?? pages['1']!;
  }
}

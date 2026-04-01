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
        imageEmoji: '🐱',
        signs: [
          SignWord(word: 'Cat', signEmoji: '🐱', description: 'Pinch fingers near cheek'),
          SignWord(word: 'Happy', signEmoji: '😊', description: 'Brush chest upward'),
        ],
      ),
      StoryPage(
        pageNumber: 2,
        totalPages: 3,
        caption: 'Whiskers loves to play with yarn.',
        imageEmoji: '🧶',
        signs: [
          SignWord(word: 'Play', signEmoji: '🤙', description: 'Wiggle both hands'),
          SignWord(word: 'Love', signEmoji: '❤️', description: 'Cross arms on chest'),
        ],
      ),
      StoryPage(
        pageNumber: 3,
        totalPages: 3,
        caption: 'At night, Whiskers sleeps peacefully.',
        imageEmoji: '😴',
        signs: [
          SignWord(word: 'Sleep', signEmoji: '😴', description: 'Tilt head on hand'),
          SignWord(word: 'Night', signEmoji: '🌙', description: 'Arc hand downward'),
        ],
      ),
    ],
    '2': [
      StoryPage(
        pageNumber: 1,
        totalPages: 3,
        caption: 'Thomas Gallaudet was a great teacher.',
        imageEmoji: '👨‍🏫',
        signs: [
          SignWord(word: 'Teacher', signEmoji: '👨‍🏫', description: 'Flat hands from temples outward'),
          SignWord(word: 'Great', signEmoji: '👍', description: 'Thumbs up with both hands'),
        ],
      ),
      StoryPage(
        pageNumber: 2,
        totalPages: 3,
        caption: 'He helped deaf people learn to communicate.',
        imageEmoji: '🤝',
        signs: [
          SignWord(word: 'Help', signEmoji: '🤲', description: 'Lift fist on open palm'),
          SignWord(word: 'Learn', signEmoji: '📚', description: 'Pick up from palm to head'),
        ],
      ),
      StoryPage(
        pageNumber: 3,
        totalPages: 3,
        caption: 'His school still exists today!',
        imageEmoji: '🏫',
        signs: [
          SignWord(word: 'School', signEmoji: '🏫', description: 'Clap hands twice'),
          SignWord(word: 'Today', signEmoji: '📅', description: 'Both index fingers point down'),
        ],
      ),
    ],
    '3': [
      StoryPage(
        pageNumber: 1,
        totalPages: 3,
        caption: 'Helen Keller could not see or hear.',
        imageEmoji: '🌟',
        signs: [
          SignWord(word: 'See', signEmoji: '👁️', description: 'V-shape from eyes outward'),
          SignWord(word: 'Hear', signEmoji: '👂', description: 'Point finger to ear'),
        ],
      ),
      StoryPage(
        pageNumber: 2,
        totalPages: 3,
        caption: 'Anne Sullivan taught her to communicate.',
        imageEmoji: '✋',
        signs: [
          SignWord(word: 'Teach', signEmoji: '📖', description: 'Pinch fingers from forehead'),
          SignWord(word: 'Talk', signEmoji: '💬', description: 'Index fingers alternate at mouth'),
        ],
      ),
      StoryPage(
        pageNumber: 3,
        totalPages: 3,
        caption: 'Helen became a famous author and speaker!',
        imageEmoji: '✍️',
        signs: [
          SignWord(word: 'Write', signEmoji: '✍️', description: 'Mime writing on open palm'),
          SignWord(word: 'Famous', signEmoji: '⭐', description: 'Index fingers circle outward'),
        ],
      ),
    ],
  };

  static List<StoryPage> getPages(String storyId) {
    return pages[storyId] ?? pages['1']!;
  }
}

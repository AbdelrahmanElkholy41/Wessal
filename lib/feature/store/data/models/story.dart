// lib/models/story.dart

class Story {
  final String id;
  final String title;
  final int pages;
  final int signsCount;
  final String image;

  const Story({
    required this.id,
    required this.title,
    required this.pages,
    required this.signsCount,
    required this.image,
  });
}

class StoryData {
  static const List<Story> stories = [
    Story(id: '1', title: 'The Happy Cat', pages: 3, signsCount: 6, image: 'assets/images/cat.png'),
    Story(id: '2', title: 'Thomas Gallaudet', pages: 3, signsCount: 9, image: 'assets/images/cat.png'),
    Story(id: '3', title: 'Helen Keller', pages: 3, signsCount: 15, image: 'assets/images/cat.png'),
    Story(id: '4', title: 'The Happy Cat', pages: 3, signsCount: 6, image: 'assets/images/cat.png'),
    Story(id: '5', title: 'The Happy Cat', pages: 3, signsCount: 6, image: 'assets/images/cat.png'),
    Story(id: '6', title: 'The Happy Cat', pages: 3, signsCount: 6, image: 'assets/images/cat.png'),
  ];
}

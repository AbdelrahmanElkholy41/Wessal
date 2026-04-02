// lib/feature/signs/data/models/sign_level.dart

class SignLesson {
  final String id;
  final String title;
  final String subtitle;
  bool isCompleted;

  SignLesson({
    required this.id,
    required this.title,
    required this.subtitle,
    this.isCompleted = false,
  });
}

class SignLevel {
  final String id;
  final String name;
  final List<SignLesson> lessons;

  SignLevel({
    required this.id,
    required this.name,
    required this.lessons,
  });

  int get completedCount => lessons.where((l) => l.isCompleted).length;
  int get totalCount => lessons.length;
  double get progress => totalCount == 0 ? 0 : completedCount / totalCount;
}

class SignLevelData {
  static final List<SignLevel> levels = [
    SignLevel(
      id: 'beginner',
      name: 'Beginner',
      lessons: [
        SignLesson(id: 'b1', title: 'Lesson 1', subtitle: 'Basic', isCompleted: true),
        SignLesson(id: 'b2', title: 'Lesson 2', subtitle: 'Family', isCompleted: true),
        SignLesson(id: 'b3', title: 'Lesson 3', subtitle: 'Food', isCompleted: true),
        SignLesson(id: 'b4', title: 'Lesson 4', subtitle: 'Food', isCompleted: true),
        SignLesson(id: 'b5', title: 'Lesson 5', subtitle: 'Food', isCompleted: true),
        SignLesson(id: 'b6', title: 'Lesson 6', subtitle: 'Food', isCompleted: true),
        SignLesson(id: 'b7', title: 'Lesson 7', subtitle: 'Colors', isCompleted: true),
        SignLesson(id: 'b8', title: 'Lesson 8', subtitle: 'Numbers', isCompleted: true),
        SignLesson(id: 'b9', title: 'Lesson 9', subtitle: 'Greetings', isCompleted: true),
        SignLesson(id: 'b10', title: 'Lesson 10', subtitle: 'Animals', isCompleted: true),
        SignLesson(id: 'b11', title: 'Lesson 11', subtitle: 'Weather', isCompleted: true),
        SignLesson(id: 'b12', title: 'Lesson 12', subtitle: 'Time', isCompleted: true),
      ],
    ),
    SignLevel(
      id: 'intermediate',
      name: 'Intermediate',
      lessons: [
        SignLesson(id: 'i1', title: 'Lesson 1', subtitle: 'Emotions', isCompleted: true),
        SignLesson(id: 'i2', title: 'Lesson 2', subtitle: 'School', isCompleted: true),
        SignLesson(id: 'i3', title: 'Lesson 3', subtitle: 'Sports', isCompleted: true),
        SignLesson(id: 'i4', title: 'Lesson 4', subtitle: 'Travel', isCompleted: false),
        SignLesson(id: 'i5', title: 'Lesson 5', subtitle: 'Health', isCompleted: false),
        SignLesson(id: 'i6', title: 'Lesson 6', subtitle: 'Work', isCompleted: false),
        SignLesson(id: 'i7', title: 'Lesson 7', subtitle: 'Hobbies', isCompleted: false),
        SignLesson(id: 'i8', title: 'Lesson 8', subtitle: 'Nature', isCompleted: false),
        SignLesson(id: 'i9', title: 'Lesson 9', subtitle: 'Technology', isCompleted: false),
        SignLesson(id: 'i10', title: 'Lesson 10', subtitle: 'Culture', isCompleted: false),
      ],
    ),
    SignLevel(
      id: 'advanced',
      name: 'Advanced',
      lessons: [
        SignLesson(id: 'a1', title: 'Lesson 1', subtitle: 'Conversation', isCompleted: false),
        SignLesson(id: 'a2', title: 'Lesson 2', subtitle: 'Stories', isCompleted: false),
        SignLesson(id: 'a3', title: 'Lesson 3', subtitle: 'News', isCompleted: false),
        SignLesson(id: 'a4', title: 'Lesson 4', subtitle: 'Debate', isCompleted: false),
        SignLesson(id: 'a5', title: 'Lesson 5', subtitle: 'Poetry', isCompleted: false),
        SignLesson(id: 'a6', title: 'Lesson 6', subtitle: 'Law', isCompleted: false),
        SignLesson(id: 'a7', title: 'Lesson 7', subtitle: 'Medicine', isCompleted: false),
        SignLesson(id: 'a8', title: 'Lesson 8', subtitle: 'Science', isCompleted: false),
      ],
    ),
  ];
}

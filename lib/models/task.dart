class Task {
  String id;
  String title;
  String description;
  String category;
  DateTime dateTime;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.dateTime,
    this.isDone = false,
  });
}

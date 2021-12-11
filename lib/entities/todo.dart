class Todo {
  Todo({required this.title, required this.isDone, required this.createdAt});

  String title;
  bool isDone;
  DateTime createdAt;

  Todo copyWith(String? title, bool? isDone, DateTime? createdAt) {
    return Todo(
        title: title ?? this.title,
        isDone: isDone ?? this.isDone,
        createdAt: createdAt ?? this.createdAt);
  }
}

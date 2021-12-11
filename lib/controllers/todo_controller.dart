import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/entities/todo.dart';

final todoProvider = StateNotifierProvider<TodoController, List<Todo>>(
    (ref) => TodoController());

class TodoController extends StateNotifier<List<Todo>> {
  TodoController() : super([]);

  void toggleDone(Todo todo) {
    state = state.map((e) {
      if (e.title == todo.title) {
        return e.copyWith(null, !e.isDone, null);
      } else {
        return e;
      }
    }).toList();
  }

  void add(String title) {
    final todo = Todo(title: title, isDone: false, createdAt: DateTime.now());
    state = state.map((e) => e.copyWith(null, null, null)).toList() + [todo];
  }
}

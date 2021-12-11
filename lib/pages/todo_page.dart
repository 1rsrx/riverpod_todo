import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/controllers/todo_controller.dart';
import 'package:todo/dialogs/input_dialog.dart';
import 'package:todo/entities/todo.dart';

class TodoPage extends ConsumerWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ProviderScope(child: _TodoListPageLayout());
  }
}

class _TodoListPageLayout extends ConsumerWidget {
  const _TodoListPageLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(todoProvider.notifier);

    return Scaffold(
        appBar: AppBar(title: const Text('Todoリスト'), actions: [
          TextButton(
              onPressed: () {
                InputDialog(context).show(onAddButtonTapped: (title) {
                  controller.add(title);
                });
              },
              child: const Text(
                '追加',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ))
        ]),
        body: const _TodoList());
  }
}

class _TodoList extends ConsumerWidget {
  const _TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return ListView.builder(
        itemBuilder: (_, index) =>
            _TodoListTile(todo: todos[index], index: index),
        itemCount: todos.length);
  }
}

class _TodoListTile extends ConsumerWidget {
  const _TodoListTile({required this.todo, required this.index, Key? key})
      : super(key: key);

  final Todo todo;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(todo.title), _checkButton(ref, todo)],
        ));
  }

  Widget _checkButton(WidgetRef ref, Todo todo) {
    return IconButton(
        onPressed: () {
          ref.watch(todoProvider.notifier).toggleDone(todo);
        },
        icon: todo.isDone
            ? const Icon(Icons.check_box_outlined)
            : const Icon(Icons.crop_square_outlined));
  }
}

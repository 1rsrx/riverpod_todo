import 'package:flutter/material.dart';

class InputDialog {
  InputDialog(this.context);

  BuildContext context;

  void show(
      {Function(String)? onAddButtonTapped, Function? onCloseButtonTapped}) {
    final controller = TextEditingController();

    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Todoを入力'),
            content: TextField(controller: controller),
            actions: [
              TextButton(
                  onPressed: () {
                    if (onAddButtonTapped != null) {
                      onAddButtonTapped(controller.text);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('追加')),
              TextButton(
                  onPressed: () {
                    if (onCloseButtonTapped != null) {
                      onCloseButtonTapped();
                    }
                    Navigator.pop(context);
                  },
                  child: const Text('キャンセル'))
            ],
          );
        });
  }
}

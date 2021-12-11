import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/pages/todo_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TodoPage());
  }
}

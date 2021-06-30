import 'package:flutter/material.dart';
import 'package:my_todoapp/tododetails.dart';

void main() {
  runApp(Todo());
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: TodoList(),
        debugShowCheckedModeBanner: false
    );
  }
}
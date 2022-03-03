import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  late final String taskTitle;
  late final bool isChecked;
  late final checkboxCallback;
  late final deleteTask;

  TaskTile(
      {required this.taskTitle,
      required this.isChecked,
      required this.checkboxCallback,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: deleteTask,
    );
  }
}

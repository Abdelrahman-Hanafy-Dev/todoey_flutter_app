import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter_app/models/task.dart';
import 'package:todoey_flutter_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  late final onTextFieldUpdated;
  late final onAddButtonPressed;

  AddTaskScreen(
      {required this.onTextFieldUpdated, required this.onAddButtonPressed});

  @override
  Widget build(BuildContext context) {
    String userInput = '';
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 25.0),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 50.0,
                ),
              ),
              TextField(
//                onChanged: onTextFieldUpdated,
                onChanged: (newValue) {
                  userInput = newValue;
                },
                textAlign: TextAlign.center,
                autofocus: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.lightBlueAccent, width: 3.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextButton(
//                onPressed: onAddButtonPressed,
                onPressed: () {
                  if (userInput != '') {
                    final Task newTask = Task(name: userInput);
                    Provider.of<TaskData>(context, listen: false)
                        .addNewTask(newTask);
                    userInput = '';
                  }
                  Navigator.pop(context);
                },
                child: const Text('Add'),
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 25.0),
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlueAccent,
                  minimumSize: const Size(double.infinity, 50.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

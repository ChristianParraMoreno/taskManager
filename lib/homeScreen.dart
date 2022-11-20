import 'package:flutter/material.dart';
import '../Components/individual.dart';
import '../Components/dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  final controller_ = TextEditingController();

  List taskList = [
    ["tutorial", false],
    ["HW5", false],
  ];

  void checkChanged(bool? value, int index) {
    setState(() {
      taskList[index][1] = !taskList[index][1];
    });
  }

  void saveTask() {
    setState(() {
      taskList.add([controller_.text, false]);
      controller_.clear();
    });
    Navigator.of(context).pop();
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogAnswer(
          controller: controller_,
          onSave: saveTask,
          onCancel: Navigator.of(context).pop,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        title: const Text(
          'Task List',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'Lato',
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: const Color(0xFF312f30),
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return Individual(
            taskName: taskList[index][0],
            completedTask: taskList[index][1],
            onChanged: (value) => checkChanged(value, index),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(
              onPressed: createTask,
              backgroundColor: const Color(0xFF78281D),
              child: Icon(Icons.add)),
    );
  }
}

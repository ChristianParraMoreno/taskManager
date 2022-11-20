import 'package:flutter/material.dart';
import 'package:flutter_application_1/database.dart';
import '../Components/individual.dart';
import '../Components/dialog.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeScreen();
}

class HomeScreen extends State<HomePage> {
  final myBox_ = Hive.box('myBox');
  TaskDataBase taskData = TaskDataBase();

  @override
  void initState() {
    if (myBox_.get("TASKLIST") == null) {
      taskData.makeDataFirstOpen();
    } else {
      taskData.uploadData();
    }
    super.initState();
  }

  final controller_ = TextEditingController();

  void checkChanged(bool? value, int index) {
    setState(() {
      taskData.taskList[index][1] = !taskData.taskList[index][1];
    });
    taskData.updateData();
  }

  void saveTask() {
    setState(() {
      taskData.taskList.add([controller_.text, false]);
      controller_.clear();
    });
    Navigator.of(context).pop();
    taskData.updateData();
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

  void deleteTask_(int index) {
    setState(() {
      taskData.taskList.removeAt(index);
    });
    taskData.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      appBar: AppBar(
        title: const Text(
          'Task List',
          style: TextStyle(
            color: Color(0xFF81D4FA),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
            fontFamily: 'Lato',
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: taskData.taskList.length,
        itemBuilder: (context, index) {
          return Individual(
            taskName: taskData.taskList[index][0],
            completedTask: taskData.taskList[index][1],
            onChanged: (value) => checkChanged(value, index),
            deleteTask: (context) => deleteTask_(index),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(
              onPressed: createTask,
              backgroundColor: Colors.white,
              child: const Icon(
                  Icons.add,
                  color: Color(0xFF81D4FA),
                  size: 30.0,
              )
          ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:llunkei_test_app/constants/utils.dart';
import 'package:llunkei_test_app/features/home/screens/dialog_box.dart';
import 'package:llunkei_test_app/features/home/screens/todo_tile.dart';

import 'package:provider/provider.dart';
import 'package:llunkei_test_app/providers/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // text controller
  final _controller = TextEditingController();

  // NEW/UNTESTED CODE START
  void aTDL({
    required BuildContext context,
    required String taskName,
    required bool onChanged,
    required BuildContext deleteFunction,
  }) async {
    try {} catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // NEW/UNTESTED CODE START
  // list of todo tasks
  List toDoList = [
    ["task 1", false],
    ["task 2", false],
  ];

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.toJson(),
        ),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      // body: Center(
      //   child: Text(
      //     user.toJson(),
      //   ),
      // ),
    );
  }
}

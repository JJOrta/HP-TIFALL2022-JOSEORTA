import 'package:flutter/material.dart';
import 'package:llunkei_test_app/constants/global_variables.dart';
import 'package:llunkei_test_app/features/account/widgets/single_todolist.dart';

class ToDoLists extends StatefulWidget {
  const ToDoLists({super.key});

  @override
  State<ToDoLists> createState() => _ToDoListsState();
}

class _ToDoListsState extends State<ToDoLists> {
  // temporary to do list
  List list = [{}];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: const Text(
                'Your To Do Lists',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                right: 15,
              ),
              child: Text(
                'See All',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            ),
          ],
        ),
        // display to do lists
        Container(
          height: 170,
          padding: const EdgeInsets.only(
            left: 10,
            top: 20,
            right: 0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return SingleToDoList();
            },
          ),
        ),
      ],
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  // NEW/UNTESTED CODE START
  Map<String, dynamic> toMap() {
    return {
      'taskName': taskName,
      'taskCompleted': taskCompleted,
      'onChanged': onChanged,
      'deleteFunction': deleteFunction,
      // 'updateFunction': updateFunction,
    };
  }

  factory ToDoTile.fromMap(Map<String, dynamic> map) {
    return ToDoTile(
      taskName: map['taskName'] ?? '',
      taskCompleted: map['taskCompleted'] ?? '',
      onChanged: map['onChanged'] ?? '',
      deleteFunction: map['deleteFunction'],
      // updateFunction: map['updateFunction']
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoTile.fromJson(String source) =>
      ToDoTile.fromMap(json.decode(source));
  // NEW/UNTESTED CODE END

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              // checkbox
              Checkbox(value: taskCompleted, onChanged: onChanged),

              // task name
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

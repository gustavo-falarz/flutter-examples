import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/data_class.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (BuildContext context, taskData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return taskData.tasks[index];
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}

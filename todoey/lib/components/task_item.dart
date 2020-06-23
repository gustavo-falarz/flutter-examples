import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/model/data_class.dart';
import 'package:todoey/screens/add_task_screen.dart';

class TaskItem extends StatelessWidget {
  final Function onChanged;
  final String taskText;
  final bool done;

  const TaskItem({@required this.taskText, this.onChanged, this.done = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).deleteTask(this);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            taskText,
            style: TextStyle(
              decoration: done ? TextDecoration.lineThrough : null,
              fontSize: 18.0,
            ),
          ),
          Checkbox(
            activeColor: colorsPrimary,
            value: done,
            onChanged: (value) {
              Provider.of<TaskData>(
                context,
                listen: false,
              ).finishTask(this, value);
            },
          )
        ],
      ),
    );
  }
}

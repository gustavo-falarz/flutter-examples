import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/components/task_item.dart';
import 'package:todoey/model/data_class.dart';

const colorsPrimary = Colors.lightBlueAccent;

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String taskText;

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 30.0,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add task',
              style: TextStyle(
                color: colorsPrimary,
                fontSize: 25.0,
              ),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                focusColor: colorsPrimary,
                hoverColor: colorsPrimary,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorsPrimary,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: colorsPrimary,
                    width: 3.0,
                  ),
                ),
              ),
              onChanged: (value) {
                taskText = value;
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              height: 50.0,
              minWidth: double.infinity,
              color: colorsPrimary,
              onPressed: () {
                addTask(taskText, context);
              },
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTask(String taskText, BuildContext context) {
    if (taskText.isEmpty) {
      return;
    }
    TaskItem task = TaskItem(
      taskText: taskText,
    );
    Provider.of<TaskData>(context, listen: false).updateTasks(task);
    Navigator.pop(context);
  }
}

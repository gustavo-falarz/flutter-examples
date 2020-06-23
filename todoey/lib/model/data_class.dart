import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoey/components/task_item.dart';

class TaskData extends ChangeNotifier {
  List<TaskItem> _tasks = [];

  UnmodifiableListView<TaskItem> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void updateTasks(TaskItem taskItem) {
    _tasks.add(taskItem);
    notifyListeners();
  }

  void deleteTask(TaskItem taskItem) {
    _tasks.remove(taskItem);
    notifyListeners();
  }

  void finishTask(TaskItem taskItem, bool value) {
    _tasks.remove(taskItem);
    _tasks.add(
      TaskItem(
        taskText: taskItem.taskText,
        done: value,
      ),
    );
    notifyListeners();
  }
}

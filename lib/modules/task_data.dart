import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> _tasks = [
    Task(name: 'Do homework'),
    Task(name: 'Buy Burger'),
    Task(name: 'Buy of many Burgers'),
  ];

  int get taskCount {
    return _tasks.length;
  }

  //using this UnmodifiableListView means
  //you can not alter a private variable.
  //it throws exception in run time
  // see the documentation of add using this collection.
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  set taskCountNum(int) {}

  void addTaskData(String newString) {
    _tasks.add(Task(name: newString));

    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask({bool isTaskCheck, int taskIndex}) {
    if (isTaskCheck) {
      _tasks.removeAt(taskIndex);
      notifyListeners();
    }
  }
} //end class

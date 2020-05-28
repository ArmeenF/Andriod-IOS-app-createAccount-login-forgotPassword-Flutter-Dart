import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:thedailychallenge/models/tasks.dart';

class TaskNotifier with ChangeNotifier {
  List<Task> _TaskList = [];
  Task _currentTask;

  UnmodifiableListView<Task> get TaskList => UnmodifiableListView(_TaskList);

  Task get currentTask => _currentTask;

  set TaskList(List<Task> TaskList) {
    _TaskList = TaskList;
    notifyListeners();
  }

  set currentTask(Task task) {
    _currentTask = task;
    notifyListeners();
  }
}

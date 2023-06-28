import 'package:flutter/material.dart';
import '../../../models/modal_task.dart';

class TaskProvider extends ChangeNotifier {
  late int latestTaskId;

  List<ModalTask> pendingTasks = [];

  List<ModalTask> completedTasks = [];

  void addToCompleted(value){
    completedTasks.add(value);
    notifyListeners();
  }


  void addNewTask(title, description, context) {
    if(title.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Title cannot be empty')));
    } else{
      int taskId = DateTime.now().millisecondsSinceEpoch;
      latestTaskId = taskId;
      pendingTasks.add(ModalTask(title: title, description: description, id: latestTaskId));
      }
    notifyListeners();
  }


  void taskCompleted(index){
    addToCompleted(pendingTasks[index]);
    pendingTasks.removeAt(index);
    notifyListeners();
  }

  void taskDeleted(index, task){
    task.removeAt(index);
    notifyListeners();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/models/modal_task.dart';
import '../home/tasks/task_provider.dart';

class TaskDetailedProvider extends ChangeNotifier {

  deleteThisTask(BuildContext context, int id, String status){
    TaskProvider taskProvider = Provider.of<TaskProvider>(context, listen: false);

   List<ModalTask> task = status == 'pending' ?
    taskProvider.pendingTasks : taskProvider.completedTasks;
   task.removeWhere((task) => task.id == id);
   taskProvider.notifyListeners();
  }

  completedThisTask(BuildContext context, int id){
    TaskProvider taskProvider = Provider.of<TaskProvider>(context, listen: false);
    ModalTask completedTask = taskProvider.pendingTasks.firstWhere((task) => task.id == id);
    taskProvider.addToCompleted(completedTask);
    taskProvider.pendingTasks.remove(completedTask);
    taskProvider.notifyListeners();
  }

}
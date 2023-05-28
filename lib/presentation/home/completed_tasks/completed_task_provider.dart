import 'package:flutter/material.dart';
import 'package:to_do_app_with_provider/models/modal_task.dart';

class CompletedTaskProvider extends ChangeNotifier{

  List<ModalTask> completedTasks = [];

  void addItem(value){
    completedTasks.add(value);
    print('completedTasks => $completedTasks');
    notifyListeners();
  }
}
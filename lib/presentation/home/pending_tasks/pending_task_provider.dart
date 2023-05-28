import 'package:flutter/material.dart';
import '../../../models/modal_task.dart';
import '../completed_tasks/completed_task_provider.dart';

class PendingTaskProvider extends ChangeNotifier {
  final CompletedTaskProvider _completedTaskProvider = CompletedTaskProvider();

  // List<Map<String,String>> pendingTasks = [
  //   {
  //     'title': 'Complete Project Proposal',
  //     'description': 'Write a detailed project proposal including scope, deliverables, and timeline.',
  //   },
  //   {
  //     'title': 'Prepare Presentation Slides',
  //     'description': 'Create visually appealing slides for the upcoming client presentation.',
  //   },
  //   {
  //     'title': 'Conduct User Research',
  //     'description': 'Interview target users to gather insights and feedback for product improvement.',
  //   },
  //   {
  //     'title': 'Implement Login Functionality',
  //     'description': 'Develop the login feature with user authentication and password encryption.',
  //   },
  // ];

  List<ModalTask> pendingTasks = [
    ModalTask(title: 'title 1', description: 'description1')
  ];

  void addNewTask(title, description, context) {
    if(title.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Title cannot be empty')));
    } else{
      pendingTasks.add(ModalTask(title: title, description: description));
      }
    notifyListeners();
  }


  void taskCompleted(index){
    _completedTaskProvider.addItem(pendingTasks[index]);
    pendingTasks.removeAt(index);
    notifyListeners();
  }

  void taskDeleted(index){
    pendingTasks.removeAt(index);
    notifyListeners();
  }
}
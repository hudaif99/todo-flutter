import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/presentation/task_detailed_page/task_detailed_provider.dart';
import 'package:to_do_app_with_provider/widgets/common_button.dart';
import '../../utils/font_constants.dart';

class TaskDetailedPage extends StatelessWidget {
  final dynamic task;
  final int taskId;
  final String status;
  const TaskDetailedPage({
    Key? key,
    required this.task,
    required this.status,
    required this.taskId
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: _body(context),
      );
  }

  Widget _body(context){
    return Consumer<TaskDetailedProvider>(builder: (context, taskDetailedProvider, child){
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: FontConstants.primary16B,),
            const SizedBox(height: 15,),
            Text(task.description, style: FontConstants.primary15,),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: CommonButton(
                      onTap: (){
                        taskDetailedProvider.deleteThisTask(context, taskId, status);
                        Navigator.pop(context);
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.delete, size: 17, color: Color(0xFF474747),),
                          SizedBox(width: 5,),
                          Text('Delete task')
                        ],
                      ),
                    )
                ),
                Visibility(
                    visible: status == 'pending',
                    child: const SizedBox(width: 8)),
                Visibility(
                  visible: status == 'pending',
                  child: Expanded(
                      child: CommonButton(
                        onTap: (){},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.mode_edit_outline_outlined, size: 17, color: Color(0xFF474747),),
                            SizedBox(width: 5,),
                            Text('Edit task')
                          ],
                        ),
                      )
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            Visibility(
              visible: status == 'pending',
              child: CommonButton(
                onTap: (){
                  taskDetailedProvider.completedThisTask(context, taskId);
                  Navigator.pop(context);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check, size: 17, color: Color(0xFF474747),),
                    SizedBox(width: 5,),
                    Text('Task completed')
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}

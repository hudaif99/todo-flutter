import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/presentation/home/tasks/task_provider.dart';
import 'package:to_do_app_with_provider/presentation/task_detailed_page/task_detailed.dart';
import 'package:to_do_app_with_provider/widgets/task_card.dart';
import '../../../utils/font_constants.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
        builder: ((context, taskProviderModel, child) {
          final completedTasks = taskProviderModel.completedTasks;

            return completedTasks.isEmpty ?
            const Center(child: Text('You have not completed any tasks yet')) :
            ListView.separated(
              itemCount: completedTasks.length,
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              shrinkWrap: true,
              separatorBuilder: (BuildContext context,
                  int index) => const SizedBox(height: 15,),
              itemBuilder: (BuildContext context, int index) {
                final item = completedTasks[index];

                return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      taskProviderModel.taskDeleted(index, completedTasks);
                    },
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(35),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFB30000)
                      ),
                      child: const Icon(
                        Icons.delete, size: 20, color: Colors.white,),
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>
                            TaskDetailedPage(task: item, status: 'completed', taskId: item.id)));
                      },
                      child: _taskCard(item))
                );
              },
            );}));
  }

  Widget _taskCard(item) {
    return SizedBox(
      width: double.infinity,
      child: CommonCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item.title, style: FontConstants.primary15B,),
            const SizedBox(height: 10,),
            Text(item.description,
              style: FontConstants.primary14,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,)
          ],
        ),
      ),
    );
  }
}
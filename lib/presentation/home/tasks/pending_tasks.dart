import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/presentation/home/tasks/task_provider.dart';
import 'package:to_do_app_with_provider/widgets/task_card.dart';
import 'package:to_do_app_with_provider/presentation/task_detailed_page/task_detailed.dart';
import 'package:to_do_app_with_provider/utils/font_constants.dart';

class PendingTasks extends StatelessWidget {
  const PendingTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder:((context, taskProviderModel, child) {
        final pendingTasks = taskProviderModel.pendingTasks;

        return pendingTasks.isEmpty ?
          const Center(child: Text('You have no pending tasks'),) :
          ListView.separated(
        itemCount: pendingTasks.length,
        padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
        itemBuilder: (BuildContext context, int index) {
          final item = pendingTasks[index];

          return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction){
                if (direction == DismissDirection.endToStart){
                  taskProviderModel.taskDeleted(index, pendingTasks);
                }
                else{
                  taskProviderModel.taskCompleted(index);
                }
              },
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFFB30000)
                ),
                child: const Icon(Icons.delete, size: 20, color: Colors.white,),
              ),
              background: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(35),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color(0xFF2E8B57)
                ),
                child: const Icon(Icons.check, size: 20, color: Colors.white,),
              ),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => TaskDetailedPage(
                        task: item,
                        taskId: item.id,
                        status: 'pending',
                      )));
                },
                  child: _taskCard(item))
          );
          },
      );}));
  }

  Widget _taskCard(item){
    return CommonCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(item.title, style: FontConstants.primary15B,)
              ),
              InkWell(
                onTap: (){},
                child: const Icon(Icons.edit, size: 18,)
              )
            ],
          ),
          const SizedBox(height: 10,),
          Text(item.description,
            style: FontConstants.primary14, maxLines: 2, overflow: TextOverflow.ellipsis)
        ],
      ),
    );
  }
}

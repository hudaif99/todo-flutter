import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/widgets/task_card.dart';
import '../../../utils/font_constants.dart';
import 'completed_task_provider.dart';

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CompletedTaskProvider>(
        builder: ((context, completedTaskProviderModel, child) {
          final completedTasks = completedTaskProviderModel.completedTasks;

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
                    key: Key(item.toString()),
                    onDismissed: (direction) {},
                    secondaryBackground: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.all(35),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFFB30000)
                      ),
                      child: const Icon(
                        Icons.delete, size: 20, color: Colors.white,),
                    ),
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.all(35),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xFF2E8B57)
                      ),
                      child: const Icon(
                        Icons.check, size: 20, color: Colors.white,),
                    ),
                    child: _taskCard(item)
                );
              },
            );}));
  }

  Widget _taskCard(item) {
    return CommonCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(item.title, style: FontConstants.primary15B,)
              ),
              InkWell(
                  onTap: () {},
                  child: const Icon(Icons.edit, size: 18,)
              )
            ],
          ),
          const SizedBox(height: 10,),
          Text(item.description,
            style: FontConstants.primary14,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,)
        ],
      ),
    );
  }
}
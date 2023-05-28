import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app_with_provider/models/modal_task.dart';
import 'package:to_do_app_with_provider/presentation/home/completed_tasks/completed_tasks.dart';
import 'package:to_do_app_with_provider/presentation/home/pending_tasks/pending_task_provider.dart';
import 'package:to_do_app_with_provider/presentation/home/pending_tasks/pending_tasks.dart';
import 'package:to_do_app_with_provider/widgets/task_card.dart';
import 'package:to_do_app_with_provider/widgets/text_field.dart';
import 'completed_tasks/completed_task_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _descriptionEditingController = TextEditingController();
  final PendingTaskProvider _pendingTaskProvider = PendingTaskProvider();
  // late CompletedTaskProvider _completedTaskProvider;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _completedTaskProvider = CompletedTaskProvider();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
      statusBarColor: Colors.white
    ));
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          floatingActionButton: _fab(),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          body: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            height: 45,
            child: SearchBar(
              elevation: MaterialStateProperty.all(1.0),
              backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).colorScheme.secondary),
              hintText: 'Search for tasks',
              leading: const Icon(Icons.search),
              padding: MaterialStateProperty.all(const EdgeInsets.only(left: 20)),
            ),
          ),
        ),
        TabBar(
          indicatorColor: Theme.of(context).tabBarTheme.indicatorColor,
          labelColor: Theme.of(context).textTheme.titleMedium!.color,
          // dividerColor:  Theme.of(context).textTheme.titleMedium!.color,
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text('Pending tasks'),
            ),
            Tab(
              child: Text('Completed tasks'),
            )
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: [
            // Consumer<PendingTaskProvider>(
            //     builder: (context, pendingTaskProviderModel, child) {
            //       return PendingTasks();
            //       },
            // ),
            const PendingTasks(),
            ChangeNotifierProvider.value(
              value: CompletedTaskProvider(),
                child: const CompletedTasks()
            )
          ],
        ))
      ],
    );
  }

  Widget _fab(){
    return FloatingActionButton(
      onPressed: (){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Add new task'),
            content:  Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonTextfield(
                  hintText: 'Title',
                  controller: _titleEditingController
                ),
                const SizedBox(height: 10,),
                CommonTextfield(
                  hintText: 'Description (optional)',
                  controller: _descriptionEditingController,
                  height: 120, maxLines: 4
                ),
                const SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
                              foregroundColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              )
                            ),
                            child: const Text('Cancel')
                        )),
                    const SizedBox(width: 8),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: (){
                              // _pendingTaskProvider.pendingTasks.add(Task(_titleEditingController.text, _descriptionEditingController.text));
                              _pendingTaskProvider.addNewTask(_titleEditingController.text, _descriptionEditingController.text, context);
                              // print(_pendingTaskProvider.pendingTasks);
                              setState(() {

                              });
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).buttonTheme.colorScheme?.primary,
                                foregroundColor: Theme.of(context).buttonTheme.colorScheme?.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )
                            ),
                            child: const Text('Add')
                        )),
                  ],
                )
              ],
            ),
          );
        });
      },
      child: const Icon(Icons.add),
    );
  }
}

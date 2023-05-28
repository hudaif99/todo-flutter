import 'package:flutter/material.dart';
import 'package:to_do_app_with_provider/widgets/common_button.dart';

import '../../utils/font_constants.dart';

class TaskDetailedPage extends StatefulWidget {
  final dynamic task;
  const TaskDetailedPage({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskDetailedPage> createState() => _TaskDetailedPageState();
}

class _TaskDetailedPageState extends State<TaskDetailedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(context),
    );
  }

  Widget _body(context){
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.task.title, style: FontConstants.primary16B,),
          const SizedBox(height: 15,),
          Text(widget.task.description, style: FontConstants.primary15,),
          const Spacer(),
          Row(
            children: [
              Expanded(
                  child: CommonButton(
                    onTap: (){},
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
              const SizedBox(width: 8),
              Expanded(
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
            ],
          ),
          const SizedBox(height: 2),
          CommonButton(
            onTap: (){},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, size: 17, color: Color(0xFF474747),),
                SizedBox(width: 5,),
                Text('Task completed')
              ],
            ),
          )
        ],
      ),
    );
  }
}

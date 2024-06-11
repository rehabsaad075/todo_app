import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/items/task_item_custom.dart';
import 'package:todo_app/view/screens/todo_screens/update_task_screen.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';

class AllTasksListView extends StatelessWidget {
  const AllTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        itemBuilder: (context,index){
          return  TaskItemCustom(
            onTap: () {
              navigationPushFunction(
                  context: context,
                  screen: const UpdateTaskScreen()
              );
            },
          );
        },
        separatorBuilder: (context,index)=> const SizedBox(
          height: 10,
        ),
        itemCount: 10
    );
  }
}

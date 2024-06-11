import 'package:flutter/material.dart';
import 'package:todo_app/view/screens/todo_screens/add_task_screen.dart';
import 'package:todo_app/view/componets/bodies/all_tasks_list_view.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';

class TodoHomePageScreen extends StatelessWidget {
  const TodoHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'المهام'
          ),
          leading: const Icon(
              AppIcons.listIcon
          ),
        ),
        body: const AllTasksListView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigationPushFunction(
                context: context,
                screen: const AddTaskScreen()
           );
          },
          child: const Icon(
              AppIcons.addIcon
          ),
        ),
      ),
    );
  }
}

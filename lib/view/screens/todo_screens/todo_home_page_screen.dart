import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/componets/bodies/all_tasks_body.dart';
import 'package:todo_app/view/screens/todo_screens/add_task_screen.dart';
import 'package:todo_app/view_model/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';

class TodoHomePageScreen extends StatelessWidget {
  const TodoHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetTasksCubit()..getAllTasks()..initController()..scrollerListener(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
                'المهام'
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.only(left: 18),
                child: Icon(
                    AppIcons.listIcon
                ),
              ),
            ],
          ),
          body: const AllTasksBody(),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .startFloat,
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
      ),
    );
  }
}

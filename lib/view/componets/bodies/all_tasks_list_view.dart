import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/view/componets/items/task_item_custom.dart';
import 'package:todo_app/view/componets/widgets/scroll_configuration_custom.dart';
import 'package:todo_app/view/screens/todo_screens/update_task_screen.dart';
import 'package:todo_app/view_model/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';

class AllTasksListView extends StatelessWidget {
  const AllTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTasksState>(
      builder: (context, state) {
        GetTasksCubit getTasksCubit=GetTasksCubit.get(context);
        return ScrollConfigurationCustom(
          axisDirection: AxisDirection.up,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              reverse: true,
              itemBuilder: (context, index) {
                return TaskItemCustom(
                  onTap: () {
                    navigationPushFunction(
                        context: context,
                        screen: const UpdateTaskScreen()
                    );
                  }, tasks: getTasksCubit.taskModel?.data?.tasks?[index]??Tasks(),
                );
              },
              separatorBuilder: (context, index) =>
              const SizedBox(
                height: 10,
              ),
              itemCount: getTasksCubit.taskModel?.data?.tasks?.length??0
          ),
        );
      },
    );
  }
}

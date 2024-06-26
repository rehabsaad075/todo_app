import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/view/componets/items/task_item_custom.dart';
import 'package:todo_app/view/componets/widgets/circular_progress_loading_custom.dart';
import 'package:todo_app/view/componets/widgets/scroll_configuration_custom.dart';
import 'package:todo_app/view/screens/todo_screens/update_task_screen.dart';
import 'package:todo_app/view_model/cubits/delete_cubit/delete_cubit.dart';
import 'package:todo_app/view_model/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todo_app/view_model/utils/functions/navigation_functions.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class AllTasksListView extends StatelessWidget {
  final GetTasksCubit getTasksCubit;

  const AllTasksListView({super.key, required this.getTasksCubit});

  @override
  Widget build(BuildContext context) {
    return ScrollConfigurationCustom(
        child: ListView(
          controller: getTasksCubit.scrollController,
          children: [
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemBuilder: (context, index) {
                  return BlocProvider(
                    create: (context) => DeleteCubit(),
                    child: BlocBuilder<DeleteCubit, DeleteState>(
                      builder: (context, state) {
                        return TaskItemCustom(
                          onTap: () {
                            getTasksCubit.changeTaskIndex(index);
                            navigationPushFunction(
                                context: context, screen: UpdateTaskScreen(
                              id: getTasksCubit.taskModel?.data?.tasks?[index]
                                  .id ??
                                  0,
                            ));
                          },
                          tasks:
                          getTasksCubit.taskModel?.data?.tasks?[index] ??
                              Tasks(),
                          deleteOnPressed: () {
                            DeleteCubit.get(context).deleteTask(
                              getTasksCubit.taskModel?.data?.tasks?[index].id ?? 0,)
                                .then((value){
                                Navigator.pop(context);
                                getTasksCubit.getAllTasks();
                            });
                          },
                        );
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(
                  height: 10,
                ),
                itemCount: getTasksCubit.taskModel?.data?.tasks?.length ?? 0),
            if (getTasksCubit.isLoadingTasks)
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: CircularProgressLoadingCustom(
                    color: AppColors.appColor,
                  ),
                ),
              ),
            if(!getTasksCubit.hasMoreTasks)
              const Text(
                '',
              ),
          ],
        ));
  }
}

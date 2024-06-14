import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view/componets/bodies/all_tasks_list_view.dart';
import 'package:todo_app/view/componets/bodies/no_tasks_body.dart';
import 'package:todo_app/view/componets/bodies/shimmer_tasks.dart';
import 'package:todo_app/view_model/cubits/get_tasks_cubit/get_tasks_cubit.dart';

class AllTasksBody extends StatelessWidget {
  const AllTasksBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetTasksCubit, GetTasksState>(
        builder: (context,state){
          GetTasksCubit getTasksCubit = GetTasksCubit.get(context);
          if(state is GetTasksLoadingState){
            return const ShimmerTasks();
          }
          else if((getTasksCubit.taskModel?.data?.tasks?.isEmpty)??true){
            return const NoTasksBody();
          }
          else{
            return  AllTasksListView(
              getTasksCubit: getTasksCubit,
            );
          }
        }
    );
  }
}

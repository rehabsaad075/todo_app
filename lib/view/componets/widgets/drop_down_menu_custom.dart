import 'package:flutter/material.dart';
import 'package:todo_app/view_model/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class DropDownMenuCustom extends StatelessWidget {
  const DropDownMenuCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 365,
        onSelected: (value){
          AddTaskCubit.get(context).selectedTaskType(value!);
        },
        label: const Text(
          'اختر نوع المهمة',
          style: TextStyle(
              fontSize: 16,
              color: AppColors.appColor
          ),
        ),
        dropdownMenuEntries: const [
          DropdownMenuEntry(
              value: 'new',
              label: 'new'
          ),
          DropdownMenuEntry(
              value: 'doing',
              label: 'doing'
          ),
          DropdownMenuEntry(
              value: 'completed',
              label: 'completed'
          ),
          DropdownMenuEntry(
              value: 'outdated',
              label: 'outdated'
          ),
        ]
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/view_model/utils/functions/alertDialog_function.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';

class TaskItemCustom extends StatelessWidget {
  final void Function()? onTap;
  final  void Function()? deleteOnPressed;
  final Tasks tasks;

  const TaskItemCustom({super.key, required this.onTap, required this.tasks,required this.deleteOnPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.appColor)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             Text(
              tasks.title??'',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
             Text(
              tasks.description??'',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              tasks.startDate??'',
              style: TextStyle(color: AppColors.gray800!),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              tasks.endDate??'',
              style: TextStyle(color: AppColors.gray800!),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      alertDialogFunction(
                          context: context,
                          onPressed: deleteOnPressed
                      );
                    },
                    icon: const Icon(
                      AppIcons.deleteIcon,
                      color: AppColors.appColor,
                    )),
                const Spacer(),
                 Text(
                  tasks.status??'',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.appColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

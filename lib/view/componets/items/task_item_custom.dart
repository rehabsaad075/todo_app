import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';

class TaskItemCustom extends StatelessWidget {
  final void Function()? onTap;
  const TaskItemCustom({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onTap ,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                color: AppColors.appColor
            )
        ),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'go to gym',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 5,),
            const Text(
              'go to gym and do some sports',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10,),
            Text(
              '6/8/2042',
              style: TextStyle(
                  color: AppColors.gray800!
              ),
            ),
            const SizedBox(height: 5,),
            Text(
              '6/24/2024',
              style: TextStyle(
                  color: AppColors.gray800!
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: (){
                    },
                    icon:  const Icon(
                      AppIcons.deleteIcon,
                      color: AppColors.appColor,
                    )
                ),
                const Spacer(),
                const Text(
                  'outdated',
                  style: TextStyle(
                      fontSize: 16,
                      color: AppColors.appColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

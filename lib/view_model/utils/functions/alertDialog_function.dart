
import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';
import 'package:todo_app/view_model/utils/material/app_icons.dart';

void alertDialogFunction({
  required context,
  required void Function()? onPressed
}){
  showDialog(
      context: context,
      builder: (context)=>Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Row(
            children: [
              Icon(
                AppIcons.deleteIcon,
                color: AppColors.appColor,
              ),
              SizedBox(width: 10,),
              Text(
               'حذف المهمة',
                style: TextStyle(
                    color: AppColors.appColor
                ),
              ),
            ],
          ),
          content:  const Text(
              'هل تريد حذف هذه المهمة',
          ),
          titlePadding: const EdgeInsets.only(top: 24,left: 24,right: 16),
          contentPadding: const EdgeInsets.symmetric(horizontal: 22,vertical: 8),
          actionsPadding: const EdgeInsets.only(bottom: 12,right: 24,left: 12),
          titleTextStyle: const TextStyle(
            fontSize: 18
          ),
          contentTextStyle: const TextStyle(
            fontSize: 16,
            color: AppColors.appColor
          ),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text(
                    'الغاء',
                  style: TextStyle(
                    fontSize: 16,
                      color: AppColors.appColor
                  ),
                )
            ),
            TextButton(
                onPressed:onPressed ,
                child: const Text(
                   'حذف' ,
                  style: TextStyle(
                      fontSize: 16,
                    color: AppColors.appColor
                  ),
                )
            ),
          ],
        ),
      )
  );
}
import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class DropDownMenuCustom extends StatelessWidget {
  const DropDownMenuCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 365,
        onSelected: (value){

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
              value: Text('new'),
              label: 'new'
          ),
          DropdownMenuEntry(
              value: Text('doing'),
              label: 'doing'
          ),
          DropdownMenuEntry(
              value: Text('completed'),
              label: 'completed'
          ),
          DropdownMenuEntry(
              value: Text('outdated'),
              label: 'outdated'
          ),
        ]
    );
  }
}

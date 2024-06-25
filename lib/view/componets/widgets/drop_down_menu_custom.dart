import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class DropDownMenuCustom extends StatelessWidget {
  final void Function(String?)? onSelected;
  final TextEditingController? controller;
  const DropDownMenuCustom({super.key,required this.onSelected, this.controller});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 365,
        onSelected: onSelected,
        controller:controller,
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
              value: 'compeleted',
              label: 'compeleted'
          ),
          DropdownMenuEntry(
              value: 'outdated',
              label: 'outdated'
          ),
        ]
    );
  }
}

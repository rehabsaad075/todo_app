import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class CircularProgressLoadingCustom extends StatelessWidget {
  const CircularProgressLoadingCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: AppColors.appColor,
      backgroundColor: AppColors.appColor.withOpacity(1),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class CircularProgressLoadingCustom extends StatelessWidget {
  final Color? color;
  const CircularProgressLoadingCustom({super.key, this.color=AppColors.whiteColor});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: color,
      backgroundColor: AppColors.appColor.withOpacity(1),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class ShimmerWidgetCustom extends StatelessWidget {
  final Widget child;

  const ShimmerWidgetCustom({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray,
      highlightColor: AppColors.whiteColor,
      child: child,
    );
  }
}

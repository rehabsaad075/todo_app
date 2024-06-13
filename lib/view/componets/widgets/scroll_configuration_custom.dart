import 'package:flutter/material.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class ScrollConfigurationCustom extends StatelessWidget {
  final Widget child;
  final AxisDirection axisDirection;
  const ScrollConfigurationCustom({
    super.key,
    required this.child,
    this.axisDirection=AxisDirection.down
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: axisDirection,
        color: AppColors.appColor,
        child: child,
      ),
    );
  }
}

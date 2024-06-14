import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/widgets/shimmer_widget_custom.dart';
import 'package:todo_app/view_model/utils/material/app_colors.dart';

class ContainerShimmerItem extends StatelessWidget {
  final double ?width;
  const ContainerShimmerItem({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return ShimmerWidgetCustom(
      child: Container(
        height: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.appColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: 150,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              width: 250,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: 100,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 5,),
            Container(
              width: 100,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 15,),
            Container(
              width: 70,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.gray700,
              ),
            ),
            const SizedBox(height: 15,),
          ],
        ),
      ),
    );
  }
}

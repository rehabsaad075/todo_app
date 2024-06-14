import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/items/container_shimmer_item.dart';

class ShimmerTasks extends StatelessWidget {
  const ShimmerTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding:
        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemBuilder: (context, index) {
          return const ContainerShimmerItem();
        },
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: 20
    );

  }
}

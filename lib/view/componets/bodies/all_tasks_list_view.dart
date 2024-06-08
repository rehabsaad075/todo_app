import 'package:flutter/material.dart';
import 'package:todo_app/view/componets/items/task_item_custom.dart';

class AllTasksListView extends StatelessWidget {
  const AllTasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        itemBuilder: (context,index){
          return  TaskItemCustom(
            onTap: () {},
          );
        },
        separatorBuilder: (context,index)=> const SizedBox(
          height: 10,
        ),
        itemCount: 10
    );
  }
}

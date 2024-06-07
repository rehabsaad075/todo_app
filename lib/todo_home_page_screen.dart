import 'package:flutter/material.dart';
import 'package:todo_app/view_model/app_icons.dart';

class TodoHomePageScreen extends StatelessWidget {
  const TodoHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'المهام'
          ),
          leading: const Icon(
              AppIcons.listIcon
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // navigationPushFunction(
            //     context: context,
            //     screen: const AddNotesScreen()
           // );
          },
          child: const Icon(
              AppIcons.addIcon
          ),
        ),
      ),
    );
  }
}

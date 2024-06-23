import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:todo_app/view/componets/widgets/drop_down_menu_custom.dart';
import 'package:todo_app/view/componets/widgets/elvated_button_custom.dart';
import 'package:todo_app/view/componets/widgets/scroll_configuration_custom.dart';
import 'package:todo_app/view/componets/widgets/text_form_field_custom.dart';
import 'package:todo_app/view_model/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todo_app/view_model/cubits/update_task_cubit/update_task_cubit.dart';
import 'package:todo_app/view_model/utils/functions/show_date_picker_function.dart';

class UpdateTaskScreen extends StatelessWidget {
  final int id;
  const UpdateTaskScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateTaskCubit()..showSingleTask(id),
      child: BlocBuilder<UpdateTaskCubit, UpdateTaskState>(
        builder: (context, state) {
          UpdateTaskCubit updateTaskCubit=UpdateTaskCubit.get(context);
          GetTasksCubit getTasksCubit=GetTasksCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: Form(
                key: updateTaskCubit.formKeyUpdate,
                child: ScrollConfigurationCustom(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 14),
                    children: [
                       TextFormFieldCustom(
                        labelText: 'العنوان',
                        keyboardType: TextInputType.text,
                        controller: updateTaskCubit.titleUpdateController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       TextFormFieldCustom(
                        labelText: 'المهمة',
                        keyboardType: TextInputType.text,
                         controller: updateTaskCubit.taskUpdateController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldCustom(
                        labelText: 'تاريخ البدأ',
                        keyboardType: TextInputType.none,
                        controller: updateTaskCubit.startDateUpdateController,
                        onTap: () async {
                          await showDatePickerFunction(context: context)
                              .then((value) {
                            if (value != null) {
                              updateTaskCubit.startDateUpdateController.text =
                                  DateFormat('yyyy-MM-dd').format(value);
                            }
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldCustom(
                        labelText: 'تاريخ الانتهاء',
                        keyboardType: TextInputType.none,
                        controller: updateTaskCubit.lastDateUpdateController,
                        onTap: () async {
                          await showDatePickerFunction(context: context)
                              .then((value) {
                            if (value != null) {
                              updateTaskCubit.lastDateUpdateController.text =
                                  DateFormat('yyyy-MM-dd').format(value);
                            }
                            return null;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       DropDownMenuCustom(
                         controller: updateTaskCubit.taskTypeController,
                         onSelected: (value ) {
                           updateTaskCubit.selectedTaskType(value!);
                         },
                       ),
                      const SizedBox(
                        height: 35,
                      ),
                      ElevatedButtonCustom(
                        onPressed: () {
                          // updateTaskCubit.updateTask(id)
                          //     .then((value){
                          //   Navigator.pop(context);
                          //   getTasksCubit.getAllTasks();
                          // });
                        },
                        child: const Text(
                          'تعديل',
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

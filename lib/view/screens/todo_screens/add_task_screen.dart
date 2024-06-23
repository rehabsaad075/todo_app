import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:todo_app/view/componets/widgets/circular_progress_loading_custom.dart';
import 'package:todo_app/view/componets/widgets/drop_down_menu_custom.dart';
import 'package:todo_app/view/componets/widgets/elvated_button_custom.dart';
import 'package:todo_app/view/componets/widgets/scroll_configuration_custom.dart';
import 'package:todo_app/view/componets/widgets/text_form_field_custom.dart';
import 'package:todo_app/view_model/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:todo_app/view_model/cubits/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:todo_app/view_model/utils/functions/show_date_picker_function.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          AddTaskCubit addTaskCubit = AddTaskCubit.get(context);
          GetTasksCubit getTasksCubit=GetTasksCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(),
              body: Form(
                key: addTaskCubit.formKey,
                child:ScrollConfigurationCustom(
                  child: ListView(
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                    children: [
                      TextFormFieldCustom(
                        labelText: 'العنوان',
                        keyboardType: TextInputType.text,
                        controller: addTaskCubit.titleController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldCustom(
                        labelText: 'المهمة',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: addTaskCubit.taskController,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldCustom(
                        labelText: 'تاريخ البدأ',
                        readOnly: true,
                        controller: addTaskCubit.startDateController,
                        onTap: () async {
                          await showDatePickerFunction(context: context)
                              .then((value) {
                            if (value != null) {
                              addTaskCubit.startDateController.text =
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
                        readOnly: true,
                        controller: addTaskCubit.lastDateController,
                        onTap: () async {
                          await showDatePickerFunction(context: context)
                              .then((value) {
                            if (value != null) {
                              addTaskCubit.lastDateController.text =
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
                         onSelected: (value) {
                          addTaskCubit.selectedTaskType(value!);
                       },
                       ),
                      const SizedBox(
                        height: 35,
                      ),
                      ElevatedButtonCustom(
                        onPressed: () {
                          if (addTaskCubit.formKey.currentState!.validate()) {
                            addTaskCubit.addNewTask().then((value) {
                              Navigator.pop(context);
                              getTasksCubit.getAllTasks();
                            });
                          }
                        },
                        child: Visibility(
                          visible: state is AddNweTaskLoadingState,
                          replacement: const Text(
                            'إضافة',
                            style: TextStyle(fontSize: 20),
                          ),
                          child: const CircularProgressLoadingCustom(),
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
          );
        },
      ),
    );
  }
}

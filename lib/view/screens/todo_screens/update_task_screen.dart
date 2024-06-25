import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' hide TextDirection;
import 'package:todo_app/view/componets/widgets/circular_progress_loading_custom.dart';
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
                         validator: (value){
                          if(value!.isEmpty){
                            return 'خانة العنوان مطلوبة';
                          }
                          return null;
                         },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                       TextFormFieldCustom(
                        labelText: 'المهمة',
                        keyboardType: TextInputType.text,
                         controller: updateTaskCubit.taskUpdateController,
                         validator: (value){
                           if(value!.isEmpty){
                             return 'خانة المهمة مطلوبة';
                           }
                           return null;
                         },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormFieldCustom(
                        labelText: 'تاريخ البدأ',
                        readOnly: true,
                        controller: updateTaskCubit.startDateUpdateController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'تاريخ البدأ مطلوب';
                          }
                          return null;
                        },
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
                        readOnly: true,
                        controller: updateTaskCubit.lastDateUpdateController,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'تاريخ الانتهاء مطلوب';
                          }
                          return null;
                        },
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
                          if(updateTaskCubit.formKeyUpdate.currentState!.validate()){
                            updateTaskCubit.updateTask(id)
                                .then((value){
                              getTasksCubit.getAllTasks();
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Visibility(
                          visible: state is UpdateTaskLoadingState,
                          replacement:const Text(
                            'تعديل',
                            style: TextStyle(fontSize: 20),
                          ) ,
                          child: const CircularProgressLoadingCustom(),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/data/network/endPoints.dart';
import 'package:todo_app/view_model/utils/functions/show_toast_function.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitialState());

  static AddTaskCubit get(context) => BlocProvider.of<AddTaskCubit>(context);

  var titleController = TextEditingController();
  var taskController = TextEditingController();
  var startDateController = TextEditingController();
  var lastDateController = TextEditingController();

  var formKey = GlobalKey<FormState>();


  String ?taskType;
  void selectedTaskType(String value){
    taskType=value;
    emit(SelectedTaskTypeState());
  }

  void clearTaskControllers(){
    titleController.clear();
    taskController.clear();
    startDateController.clear();
    lastDateController.clear();
    taskType='';
  }


  Future<void> addNewTask() async {
    emit(AddNweTaskLoadingState());
    await DioHelper.post(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key: SharedKeys.token,),
      body: {
        "title":titleController.text,
        "description":taskController.text,
        "start_date":startDateController.text,
        "end_date":lastDateController.text,
        "status":taskType
      }
    ).then((value) {
      showToast(msg: 'تم اضافة المهمة بنجاح');
      clearTaskControllers();
      emit(AddNweTaskSuccessState());
    }).catchError((error){
      emit(AddNweTaskErrorState());
      throw error;
    });
  }
}

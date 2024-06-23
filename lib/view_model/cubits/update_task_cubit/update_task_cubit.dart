import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/get_task_model.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/data/network/endPoints.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitialState());

  static UpdateTaskCubit get(context) => BlocProvider.of<UpdateTaskCubit>(context);

  var titleUpdateController = TextEditingController();
  var taskUpdateController = TextEditingController();
  var startDateUpdateController = TextEditingController();
  var lastDateUpdateController = TextEditingController();
  var taskTypeController = TextEditingController();


  String ?taskType;
  void selectedTaskType(String value){
    taskType=value;
    emit(SelectedTaskTypeState());
  }

  var formKeyUpdate = GlobalKey<FormState>();

  GetTaskModel? getTaskModel;
  Future<void>showSingleTask(int id)async {
    emit(ShowSingleTaskLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.tasks}/$id',
      token: LocalData.get(key: SharedKeys.token,),
    ).then((value) {
      getTaskModel=GetTaskModel.fromJson(value.data);
      setDataFromApiToControllers();
      emit(ShowSingleTaskSuccessState());
    }).catchError((error){
      emit(ShowSingleTaskErrorState());
      throw error;
    });
  }

  void setDataFromApiToControllers(){
    titleUpdateController.text=getTaskModel?.data?.title??'';
    taskUpdateController.text=getTaskModel?.data?.description??'';
    startDateUpdateController.text=getTaskModel?.data?.startDate??'';
    lastDateUpdateController.text=getTaskModel?.data?.endDate??'';
    taskTypeController.text=getTaskModel?.data?.status??'';
  }

}

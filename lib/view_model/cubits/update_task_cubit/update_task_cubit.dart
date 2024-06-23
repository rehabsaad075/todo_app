import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  var formKeyUpdate = GlobalKey<FormState>();


  // Future<void>getTask()async {
  //
  // }
  //
  // Future<void>updateTask({required int id})async {
  //   emit(UpdateTaskLoadingState());
  //   await DioHelper.post(
  //       endPoint: '${EndPoints.tasks}/$id',
  //     token: LocalData.get(key: SharedKeys.token),
  //     body: {
  //       "_method":"PUT",
  //       "title":titleUpdateController.text,
  //       "description":taskUpdateController.text,
  //       "start_date":startDateUpdateController.text,
  //       "end_date":lastDateUpdateController.text,
  //       "status":"new"
  //     }
  //   ).then((value) {
  //     emit(UpdateTaskSuccessState());
  //   }).catchError((error){
  //     emit(UpdateTaskErrorState());
  //     throw error;
  //   });
  // }
}

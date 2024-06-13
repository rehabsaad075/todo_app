import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/data/network/endPoints.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitialState());

  static GetTasksCubit get(context)=>BlocProvider.of<GetTasksCubit>(context);


  TaskModel ?taskModel;
  Future<void>getAllTasks()async {
    emit(GetTasksLoadingState());
    await DioHelper.get(
      endPoint: EndPoints.tasks,
      token: LocalData.get(key: SharedKeys.token,),
    ).then((value) {
      taskModel=TaskModel.fromJson(value.data);
      emit(GetTasksSuccessState());
    }).catchError((error){
      emit(GetTasksErrorState());
    });
  }
}

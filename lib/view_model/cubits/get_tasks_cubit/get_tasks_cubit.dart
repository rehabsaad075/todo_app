import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  ScrollController scrollController=ScrollController();
  void initController(){
    scrollController=ScrollController();
  }
  void disposeController(){
    scrollController.dispose();
  }
  void scrollerListener(){
    scrollController.addListener(() {
      if(scrollController.position.atEdge ){
        if(scrollController.position.pixels !=0 && !isLoadingTasks && hasMoreTasks){
          getMoreTasks();
        }
      }
    });
  }

  bool hasMoreTasks=true;
  bool isLoadingTasks=false;

  Future<void>getMoreTasks()async {
    isLoadingTasks=true;
    emit(GetMoreTasksLoadingState());
    await DioHelper.get(
        endPoint: EndPoints.tasks,
        token: LocalData.get(key:SharedKeys.token,),
        parameters: {
          'page': (taskModel?.data?.meta?.currentPage??0)+1
        }
    ).then((value) {
      isLoadingTasks=false;
      TaskModel newTasksModel =TaskModel.fromJson(value.data);
      taskModel?.data?.meta=newTasksModel.data?.meta;
      taskModel?.data?.tasks?.addAll(newTasksModel.data?.tasks??[]);
      if(taskModel?.data?.meta?.currentPage==taskModel?.data?.meta?.lastPage)
      {
        hasMoreTasks=false;
      }
      emit(GetMoreTasksSuccessState());
    }).catchError((error){
      isLoadingTasks=false;
      if(error is DioException){
        emit(GetMoreTasksErrorState());
      }
    });
  }
}

part of 'add_task_cubit.dart';

abstract class AddTaskState {}

class AddTaskInitialState extends AddTaskState {}

class SelectedTaskTypeState extends AddTaskState{}

class AddNweTaskLoadingState extends AddTaskState {}
class AddNweTaskSuccessState extends AddTaskState {}
class AddNweTaskErrorState extends AddTaskState {}


